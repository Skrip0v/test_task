import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_task/core/bloc/auth/auth_bloc.dart';
import 'package:test_task/core/bloc/auth/auth_event.dart';
import 'package:test_task/core/bloc/auth/auth_state.dart';
import 'package:test_task/core/functions/show_alert_dialog.dart';
import 'package:test_task/core/router/router.dart';
import 'package:test_task/l10n/app_localizations.dart';
import 'package:test_task/screens/auth/phone/widgets/auth_phone_confirm_personal_data_widget.dart';
import 'package:test_task/screens/auth/phone/widgets/auth_phone_input_widget.dart';
import 'package:test_task/screens/auth/widgets/auth_body_text_widget.dart';
import 'package:test_task/screens/auth/widgets/auth_header_widget.dart';
import 'package:test_task/widgets/app_bar_widget.dart';
import 'package:test_task/widgets/colored_button_widget.dart';

@RoutePage()
class AuthPhoneScreen extends StatefulWidget {
  const AuthPhoneScreen({super.key});

  @override
  State<AuthPhoneScreen> createState() => _AuthPhoneScreenState();
}

class _AuthPhoneScreenState extends State<AuthPhoneScreen> {
  final _phoneController = TextEditingController();
  final _phoneFocus = FocusNode();
  bool _isLoading = false;

  @override
  void dispose() {
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthWaitCodeState) {
          AutoRouter.of(context).push(const AuthCodeRoute());
          setState(() => _isLoading = false);
        } else if (state is AuthNotLoggedErrorState) {
          setState(() => _isLoading = false);
          showAlertDialog(
            context,
            title: AppLocalizations.of(context)!.error,
            message: state.error,
          );
        }
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBarWidget(
          title: AppLocalizations.of(context)!.loginAndRegistration,
          isNeedBackButton: false,
        ),
        body: Container(
          margin: const EdgeInsets.only(top: 97.5, bottom: 25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  AuthHeaderWidget(
                    title: AppLocalizations.of(context)!.enterPhoneNumber,
                  ),
                  const SizedBox(height: 7.5),
                  AuthBodyTextWidget(
                    text: AppLocalizations.of(context)!.robotCallMessage,
                  ),
                  const SizedBox(height: 33),
                  AuthPhoneInputWidget(
                    controller: _phoneController,
                    focus: _phoneFocus,
                  ),
                  const SizedBox(height: 44),
                  ColoredButtonWidget(
                    text: AppLocalizations.of(context)!.signIn,
                    isLoading: _isLoading,
                    width: double.infinity,
                    margin: const EdgeInsets.symmetric(horizontal: 70),
                    onPressed: () {
                      if (_phoneController.text.isEmpty) return;
                      if (_phoneController.text.length != 18) return;
                      if (_isLoading) return;
                      setState(() => _isLoading = true);

                      var digits = _phoneController.text
                          .replaceAll(' ', '')
                          .replaceAll(')', '')
                          .replaceAll('(', '')
                          .replaceAll('+', '')
                          .replaceAll('-', '');

                      context
                          .read<AuthBloc>()
                          .add(AuthRequestCodeEvent(phoneNumber: digits));
                    },
                  ),
                ],
              ),
              const AuthPhoneConfirmPersonalDataWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
