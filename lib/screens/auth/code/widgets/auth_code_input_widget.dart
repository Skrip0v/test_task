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
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 60),
      child: PinCodeTextField(
        controller: controller,
        appContext: context,
        length: 4,
        cursorColor: Theme.of(context).colorScheme.secondary,
        cursorWidth: 1,
        cursorHeight: 25,
        hintCharacter: '•',
        hintStyle: TextStyle(
          color: Theme.of(context).colorScheme.secondary,
          fontSize: 32,
        ),
        scrollPadding: EdgeInsets.zero,
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
          activeColor: Theme.of(context).colorScheme.primary,
          selectedColor: Theme.of(context).colorScheme.primary,
          errorBorderColor: Theme.of(context).colorScheme.primary,
          inactiveColor: Theme.of(context).colorScheme.primary,
        ),
      ),
    );
  }
}
