// ignore_for_file: depend_on_referenced_packages

import 'dart:async';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_task/core/bloc/auth/auth_bloc.dart';
import 'package:test_task/core/bloc/auth/auth_event.dart';
import 'package:test_task/core/bloc/auth/auth_state.dart';
import 'package:test_task/core/functions/show_alert_dialog.dart';
import 'package:test_task/l10n/app_localizations.dart';
import 'package:test_task/screens/auth/code/widgets/auth_code_input_widget.dart';
import 'package:test_task/screens/auth/code/widgets/auth_request_code_timer_widget.dart';
import 'package:test_task/screens/auth/widgets/auth_body_text_widget.dart';
import 'package:test_task/screens/auth/widgets/auth_header_widget.dart';
import 'package:test_task/widgets/app_bar_widget.dart';
import 'package:test_task/widgets/colored_button_widget.dart';

@RoutePage()
class AuthCodeScreen extends StatefulWidget {
  const AuthCodeScreen({super.key});

  @override
  State<AuthCodeScreen> createState() => _AuthCodeScreenState();
}

class _AuthCodeScreenState extends State<AuthCodeScreen> {
  final _codeController = TextEditingController();
  late Timer _timer;
  int _currentDuration = 59;
  bool _isLoading = false;

  @override
  void initState() {
    _startTimer();
    super.initState();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthWaitCodeErrorState) {
          var error = state.error;
          setState(() => _isLoading = false);
          showAlertDialog(
            context,
            title: 'Ошибка',
            message: error,
          );
          return;
        }

        if (state is AuthLoggedState) {
          setState(() => _isLoading = false);
          showAlertDialog(
            context,
            title: 'Ключ',
            message: state.accessToken,
          );
          return;
        }
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBarWidget(
          title: AppLocalizations.of(context)!.loginAndRegistration,
        ),
        body: Container(
          width: double.infinity,
          margin: const EdgeInsets.only(top: 97.5, bottom: 25),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              AuthHeaderWidget(
                title: AppLocalizations.of(context)!.enterCode,
              ),
              const SizedBox(height: 7.5),
              AuthBodyTextWidget(
                text: AppLocalizations.of(context)!
                    .incomingCallEnterLastFourDigits,
              ),
              const SizedBox(height: 32.5),
              AuthCodeInputWidget(
                controller: _codeController,
              ),
              AuthRequestCodeTimerWidget(currentDuration: _currentDuration),
              const SizedBox(height: 10),
              ColoredButtonWidget(
                text: AppLocalizations.of(context)!.request,
                isEnable: _currentDuration <= 0,
                width: double.infinity,
                margin: const EdgeInsets.symmetric(horizontal: 70),
                onPressed: () {
                  _timer.cancel();
                  _currentDuration = 59;
                  setState(() {});
                  _startTimer();

                  context.read<AuthBloc>().add(AuthRequestAgainCodeEvent());
                },
              ),
              const SizedBox(height: 10),
              ColoredButtonWidget(
                text: AppLocalizations.of(context)!.signIn,
                isLoading: _isLoading,
                width: double.infinity,
                margin: const EdgeInsets.symmetric(horizontal: 70),
                onPressed: () async {
                  if (_isLoading) return;
                  if (_codeController.text.length != 4) return;
                  setState(() => _isLoading = true);
                  context
                      .read<AuthBloc>()
                      .add(AuthCheckCodeEvent(code: _codeController.text));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _startTimer() {
    _timer = Timer.periodic(
      const Duration(seconds: 1),
      (Timer timer) => setState(
        () {
          if (_currentDuration <= 0) {
            timer.cancel();
            setState(() {});
          } else {
            _currentDuration -= 1;
          }
        },
      ),
    );
  }
}
