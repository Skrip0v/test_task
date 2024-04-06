import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:test_task/style/app_colors.dart';

class AppBarWidget {
  static AppBar titleAndBack(
    BuildContext context, {
    required String title,
  }) {
    return AppBar(
      centerTitle: true,
      scrolledUnderElevation: 0,
      leading: IconButton(
        onPressed: () {
          AutoRouter.of(context).maybePop();
        },
        icon: SvgPicture.asset('assets/icons/back.svg'),
      ),
      title: Text(
        title,
        style: TextStyle(
          color: AppColors.text,
          fontSize: 18,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
