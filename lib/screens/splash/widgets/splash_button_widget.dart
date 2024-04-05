import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class SplashButtonWidget extends StatelessWidget {
  const SplashButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 15, right: 15),
      width: MediaQuery.of(context).size.width - 30,
      child: ElevatedButton(
        onPressed: () {
          AutoRouter.of(context).pushNamed('/authPhone');
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFFA73AFD).withOpacity(
            0.5,
          ),
        ),
        child: const Padding(
          padding: EdgeInsets.symmetric(vertical: 12),
          child: Text(
            'Привет Наталья)',
            style: TextStyle(
              fontSize: 24,
              color: Colors.white,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
    );
  }
}
