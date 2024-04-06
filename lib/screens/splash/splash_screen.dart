// ignore_for_file: depend_on_referenced_packages

import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:test_task/core/router/router.dart';
import 'package:test_task/screens/splash/widgets/splash_progress_widget.dart';
import 'package:test_task/screens/splash/widgets/splash_video_widget.dart';
import 'package:video_player/video_player.dart';

@RoutePage()
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late VideoPlayerController _videoController;
  double percent = 0.0;

  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _initVideoController();
    _startProgressBar();
  }

  @override
  void dispose() {
    _videoController.dispose();
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SplashVideoWidget(controller: _videoController),
          //Button
          Positioned(
            bottom: MediaQuery.of(context).viewPadding.bottom + 70,
            child: SplashProgressWidget(
              percent: percent,
            ),
          ),
        ],
      ),
    );
  }

  void _initVideoController() async {
    _videoController = VideoPlayerController.asset('assets/splash.mp4');
    await _videoController.initialize();
    await _videoController.setLooping(true);
    await _videoController.play();
    setState(() {});
  }

  void _startProgressBar() {
    if (_timer != null) return;
    percent = 0.0;
    _timer = Timer.periodic(
      const Duration(milliseconds: 10),
      (Timer timer) => setState(
        () {
          if (percent >= 1) {
            timer.cancel();
            _timer = null;
            setState(() {});
            AutoRouter.of(context).navigate(const AuthPhoneRoute());
          } else {
            percent += 0.0025;
          }
        },
      ),
    );
  }
}
