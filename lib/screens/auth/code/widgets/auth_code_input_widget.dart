import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:test_task/style/app_colors.dart';

class AuthCodeInputWidget extends StatelessWidget {
  const AuthCodeInputWidget({
    super.key,
    required this.controller,
  });
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return PinCodeTextField(
      controller: controller,
      appContext: context,
      length: 4,
      cursorColor: const Color(0xFF65239F),
      cursorWidth: 1,
      cursorHeight: 25,
      hintCharacter: '•',
      hintStyle: const TextStyle(
        color: Color(0xFF6E1DA5),
        fontSize: 28,
      ),scrollPadding: EdgeInsets.zero,
      animationType: AnimationType.fade,
      pinTheme: PinTheme(
        shape: PinCodeFieldShape.box,
        borderRadius: BorderRadius.circular(15),
        borderWidth: 1,
        activeBorderWidth: 1,
        errorBorderWidth: 1,
        disabledBorderWidth: 1,
        inactiveBorderWidth: 1,
        selectedBorderWidth: 1,
        fieldHeight: 55,
        fieldWidth: 55,
        activeColor: AppColors.main,
        selectedColor: AppColors.main,
        errorBorderColor: AppColors.main,
        inactiveColor: AppColors.main,
      ),
    );
  }
}
