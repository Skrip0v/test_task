import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AppBarWidget {
  static AppBar titleAndBack(
    BuildContext context, {
    required String title,
  }) {
    return AppBar(
      centerTitle: true,
      leading: IconButton(
        onPressed: () {
          AutoRouter.of(context).maybePop();
        },
        icon: SvgPicture.asset('assets/icons/back.svg'),
      ),
      title: Text(
        title,
        style: const TextStyle(
          color: Color(0xFF464646),
          fontSize: 18,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
