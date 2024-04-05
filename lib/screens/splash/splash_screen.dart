// ignore_for_file: depend_on_referenced_packages

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:test_task/screens/splash/widgets/splash_button_widget.dart';
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

  @override
  void initState() {
    super.initState();
    _initVideoController();
  }

  @override
  void dispose() {
    _videoController.dispose();
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
            bottom: MediaQuery.of(context).viewPadding.bottom + 20,
            child: const SplashButtonWidget(),
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
}
