import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const AppBarWidget({
    super.key,
    required this.title,
    this.isNeedBackButton = true,
  });

  final String title;
  final bool isNeedBackButton;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      scrolledUnderElevation: 0,
      automaticallyImplyLeading: false,
      leading: isNeedBackButton
          ? IconButton(
              onPressed: () {
                AutoRouter.of(context).maybePop();
              },
              icon: SvgPicture.asset('assets/icons/back.svg'),
            )
          : null,
      title: Text(title),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
