import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:test_task/l10n/app_localizations.dart';

class SplashProgressWidget extends StatelessWidget {
  const SplashProgressWidget({
    super.key,
    required this.percent,
  });

  final double percent;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 15, right: 15),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(100),
            child: LinearPercentIndicator(
              width: MediaQuery.of(context).size.width - 30,
              lineHeight: 76,
              percent: percent > 1.0 ? 1.0 : percent,
              padding: EdgeInsets.zero,
              backgroundColor: Colors.transparent,
              fillColor: Theme.of(context).colorScheme.primary.withOpacity(
                    0.25,
                  ),
              progressColor: Theme.of(context).colorScheme.primary.withOpacity(
                    0.75,
                  ),
            ),
          ),
        ),
        Positioned(
          child: Text(
            AppLocalizations.of(context)!.hello("Наталья)"),
            style: Theme.of(context).textTheme.labelLarge?.copyWith(
              shadows: <Shadow>[
                Shadow(
                  offset: const Offset(0, 0),
                  blurRadius: 10,
                  color: Colors.black.withOpacity(0.4),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
