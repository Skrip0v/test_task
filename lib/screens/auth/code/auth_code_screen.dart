import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:test_task/screens/auth/code/widgets/auth_code_input_widget.dart';
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

  @override
  void initState() {
    _startTimer();
    super.initState();
  }

  @override
  void dispose() {
    _codeController.dispose();
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBarWidget.titleAndBack(
        context,
        title: 'Вход/Регистрация',
      ),
      body: SafeArea(
        top: false,
        child: Container(
          width: double.infinity,
          margin: const EdgeInsets.only(top: 70),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'Введите код',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF464646),
                ),
              ),
              const SizedBox(height: 5),
              const Text(
                'Вам поступил звонок,\nвведите последние 4 цифры',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFF464646),
                ),
              ),
              const SizedBox(height: 20),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 50),
                child: AuthCodeInputWidget(
                  controller: _codeController,
                ),
              ),
              const SizedBox(height: 20),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  style: const TextStyle(
                    fontFeatures: [
                      FontFeature.tabularFigures(),
                    ],
                  ),
                  children: [
                    const TextSpan(
                      text: 'Запросите код повторно через ',
                      style: TextStyle(
                        color: Color(0xFF8C8A8A),
                      ),
                    ),
                    TextSpan(
                      text:
                          '0:${_currentDuration <= 9 ? '0$_currentDuration' : _currentDuration}',
                      style: const TextStyle(
                        color: Color(0xFFA73AFD),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Container(
                width: double.infinity,
                margin: const EdgeInsets.symmetric(horizontal: 50),
                child: ColoredButtonWidget(
                  text: 'Запросить',
                  isEnable: _currentDuration <= 0,
                  onPressed: () {
                    _timer.cancel();
                    _currentDuration = 59;
                    setState(() {});
                    _startTimer();
                  },
                ),
              ),
              const SizedBox(height: 10),
              Container(
                width: double.infinity,
                margin: const EdgeInsets.symmetric(horizontal: 50),
                child: ColoredButtonWidget(
                  text: 'Вход',
                  onPressed: () {},
                ),
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
