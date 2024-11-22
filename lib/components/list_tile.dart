import 'package:flutter/material.dart';
import 'package:notely/constants/colors.dart';
import 'package:notely/constants/text.dart';

class AppListTile extends StatelessWidget {
  final String icon;
  final String text;
  final void Function()? onTap;
  const AppListTile(
      {super.key, required this.icon, required this.text, this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: Container(
        width: 50,
        height: 50,
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: AppColors.offWhite,
          border: Border.all(color: AppColors.border),
        ),
        child: Image.asset(icon, height: 30, width: 30),
      ),
      title: Header3(
        text: text,
        textAlign: TextAlign.start,
      ),
      trailing: const Icon(
        Icons.chevron_right,
        color: AppColors.bodyText,
      ),
    );
  }
}
