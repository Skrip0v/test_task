import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class SplashButtonWidget extends StatelessWidget {
  const SplashButtonWidget({
    super.key,
    required this.percent,
  });

  final double percent;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          margin: const EdgeInsets.only(left: 15, right: 15),
          child: LinearPercentIndicator(
            width: MediaQuery.of(context).size.width - 30,
            lineHeight: 65.0,
            barRadius: const Radius.circular(100),
            percent: percent > 1.0 ? 1.0 : percent,
            backgroundColor: const Color(0xFFA73AFD).withOpacity(0.25),
            progressColor: const Color(0xFFA73AFD).withOpacity(0.75),
          ),
        ),
        const Positioned(
          child: Text(
            'Привет Наталья)',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ],
    );
  }
}
