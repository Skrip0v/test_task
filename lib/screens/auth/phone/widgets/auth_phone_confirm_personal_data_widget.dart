import 'package:flutter/material.dart';
import 'package:test_task/l10n/app_localizations.dart';

class AuthPhoneConfirmPersonalDataWidget extends StatelessWidget {
  const AuthPhoneConfirmPersonalDataWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 15, right: 15),
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          style: Theme.of(context).textTheme.bodySmall,
          children: [
            TextSpan(
              text: AppLocalizations.of(context)!.confirmationMessage,
            ),
            TextSpan(
              text: AppLocalizations.of(context)!.personalDataProcessing,
              style: TextStyle(
                color: Theme.of(context).colorScheme.primaryContainer,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
