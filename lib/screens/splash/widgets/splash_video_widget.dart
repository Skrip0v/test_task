// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class SplashVideoWidget extends StatelessWidget {
  const SplashVideoWidget({
    super.key,
    required this.controller,
  });
  final VideoPlayerController controller;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: FittedBox(
        fit: BoxFit.cover,
        child: Container(
          width:
              MediaQuery.of(context).size.height * controller.value.aspectRatio,
          height: MediaQuery.of(context).size.height,
          margin: const EdgeInsets.only(left: 40),
          child: VideoPlayer(
            controller,
          ),
        ),
      ),
    );
  }
}
