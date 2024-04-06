import 'package:flutter/material.dart';

class ColoredButtonWidget extends StatelessWidget {
  const ColoredButtonWidget({
    super.key,
    required this.text,
    required this.onPressed,
    this.isEnable = true,
    this.isLoading = false,
  });
  final String text;
  final void Function()? onPressed;
  final bool isEnable;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      duration: const Duration(milliseconds: 200),
      opacity: !isEnable ? 0.55 : 1,
      child: Container(
        padding: const EdgeInsets.only(left: 2, right: 2),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              const Color(0xFF4C79AF).withOpacity(0.1),
              Colors.white,
            ],
          ),
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
          child: ElevatedButton(
            onPressed: onPressed,
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFA73AFD),
              elevation: 0,
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 10.5, bottom: 10.5),
              child: isLoading
                  ? const SizedBox(
                      height: 23,
                      width: 23,
                      child: CircularProgressIndicator(
                        color: Colors.white,
                        strokeWidth: 2,
                      ),
                    )
                  : Text(
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
