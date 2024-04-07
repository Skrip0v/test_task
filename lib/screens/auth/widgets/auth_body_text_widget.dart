import 'package:flutter/material.dart';

class AuthBodyTextWidget extends StatelessWidget {
  const AuthBodyTextWidget({
    super.key,
    required this.text,
  });
  final String text;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: Theme.of(context).textTheme.bodyMedium,
    );
  }
}
