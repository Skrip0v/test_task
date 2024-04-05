import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

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
        color: Color(0xFF65239F),
        fontSize: 28,
      ),
      animationType: AnimationType.fade,
      pinTheme: PinTheme(
        shape: PinCodeFieldShape.box,
        borderRadius: BorderRadius.circular(9.8),
        borderWidth: 1,
        activeBorderWidth: 1,
        errorBorderWidth: 1,
        disabledBorderWidth: 1,
        inactiveBorderWidth: 1,
        selectedBorderWidth: 1,
        fieldHeight: 60,
        fieldWidth: 60,
        activeColor: const Color(0xFF65239F),
        selectedColor: const Color(0xFF65239F),
        errorBorderColor: const Color(0xFF65239F),
        inactiveColor: const Color(0xFF65239F),
      ),
    );
  }
}
