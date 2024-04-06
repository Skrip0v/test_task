import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_task/core/bloc/auth/auth_bloc.dart';
import 'package:test_task/core/bloc/auth/auth_event.dart';
import 'package:test_task/core/bloc/auth/auth_state.dart';
import 'package:test_task/core/functions/show_alert_dialog.dart';
import 'package:test_task/core/router/router.dart';
import 'package:test_task/screens/auth/phone/widgets/auth_phone_input_widget.dart';
import 'package:test_task/style/app_colors.dart';
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
            title: 'Ошибка',
            message: state.error,
          );
        }
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBarWidget.titleAndBack(
          context,
          title: 'Вход/Регистрация',
        ),
        body: SafeArea(
          top: false,
          child: Container(
            width: double.infinity,
            margin: const EdgeInsets.only(top: 97.5, bottom: 25),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Укажите номер телефона',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: AppColors.text,
                      ),
                    ),
                    const SizedBox(height: 7.5),
                    Text(
                      'На него позвонит робот\nи сообщит код подтверждения',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: AppColors.text,
                      ),
                    ),
                    const SizedBox(height: 33),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 70),
                      child: AuthPhoneInputWidget(
                        controller: _phoneController,
                        focus: _phoneFocus,
                      ),
                    ),
                    const SizedBox(height: 44),
                    Container(
                      width: double.infinity,
                      margin: const EdgeInsets.symmetric(horizontal: 70),
                      child: ColoredButtonWidget(
                        text: 'Вход',
                        isLoading: _isLoading,
                        onPressed: () {
                          AutoRouter.of(context).push(const AuthCodeRoute());

                          // if (_phoneController.text.isEmpty) return;
                          // if (_phoneController.text.length != 18) return;
                          // if (_isLoading) return;
                          // setState(() => _isLoading = true);

                          // var digits = _phoneController.text
                          //     .replaceAll(' ', '')
                          //     .replaceAll(')', '')
                          //     .replaceAll('(', '')
                          //     .replaceAll('+', '')
                          //     .replaceAll('-', '');

                          // context
                          //     .read<AuthBloc>()
                          //     .add(AuthRequestCodeEvent(phoneNumber: digits));
                        },
                      ),
                    ),
                  ],
                ),
                Container(
                  margin: const EdgeInsets.only(left: 15, right: 15),
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: const TextSpan(
                      style: TextStyle(
                        fontSize: 12,
                      ),
                      children: [
                        TextSpan(
                          text:
                              'Отправляя форму, вы подтверждаете свое\nсогласие на ',
                          style: TextStyle(
                            color: Color(0xFF464646),
                          ),
                        ),
                        TextSpan(
                          text: 'обработку персональных данных',
                          style: TextStyle(
                            color: Color(0xFF5FA744),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
