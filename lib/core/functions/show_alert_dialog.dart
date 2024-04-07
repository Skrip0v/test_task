import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

Future<void> showAlertDialog(
  BuildContext context, {
  required String title,
  required String message,
}) async {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(title),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () {
              AutoRouter.of(context).maybePop();
            },
            child: Text(
              'Понятно',
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    fontSize: 18,
                    color: Theme.of(context).colorScheme.primary,
                  ),
            ),
          ),
        ],
      );
    },
  );
}
