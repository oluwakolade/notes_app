import 'package:flutter/material.dart';
import 'package:notely/constants/colors.dart';

class NotesAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget widget;
  final Widget? prefix;
  final Widget? suffix;

  const NotesAppBar({
    super.key,
    required this.widget,
    this.prefix,
    this.suffix,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      title: widget,
      centerTitle: true,
      backgroundColor: AppColors.background,
      leading: prefix,
      actions: suffix != null ? [suffix!] : null,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
