// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:test_task/l10n/app_localizations.dart';
import 'package:intl/intl.dart';

class AuthRequestCodeTimerWidget extends StatelessWidget {
  const AuthRequestCodeTimerWidget({
    super.key,
    required this.currentDuration,
  });
  final int currentDuration;
  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        style: Theme.of(context).textTheme.labelSmall,
        children: [
          TextSpan(
            text: AppLocalizations.of(context)!.requestCodeAgain,
          ),
          TextSpan(
            text: '0:${NumberFormat("00").format(currentDuration)}',
            style: TextStyle(
              color: Theme.of(context).colorScheme.primary,
            ),
          )
        ],
      ),
    );
  }
}
