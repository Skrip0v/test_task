import 'package:flutter/material.dart';

class ColoredButtonWidget extends StatelessWidget {
  const ColoredButtonWidget({
    super.key,
    required this.text,
    required this.onPressed,
    this.isEnable = true,
  });
  final String text;
  final void Function()? onPressed;
  final bool isEnable;

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      duration: const Duration(milliseconds: 200),
      opacity: !isEnable ? 0.55 : 1,
      child: Container(
        padding: const EdgeInsets.only(left: 1, right: 1),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              const Color(0x0f4c79af).withOpacity(0.40),
              Colors.white,
            ],
          ),
          color: Colors.white,
          borderRadius: BorderRadius.circular(100),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.25),
              spreadRadius: 0,
              blurRadius: 4,
              offset: const Offset(3.5, 3.5),
            ),
          ],
        ),
        child: IgnorePointer(
          ignoring: !isEnable,
          child: OutlinedButton(
            onPressed: onPressed,
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFA73AFD),
              elevation: 0,
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 10.5, bottom: 10.5),
              child: Text(
                text,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
