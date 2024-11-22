import 'package:flutter/material.dart';
import 'package:notely/components/button.dart';
import 'package:notely/constants/colors.dart';
import 'package:notely/constants/text.dart';

class NotesDialog extends StatelessWidget {
  final String text;
  const NotesDialog({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: const EdgeInsets.all(20),
      backgroundColor: AppColors.offWhite,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Header4(
            text: text,
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              AppTextButton(
                  onPressed: () {
                    Navigator.pop(context, true);
                  },
                  text: "Yes"),
              AppTextButton(
                  onPressed: () {
                    Navigator.pop(context, false);
                  },
                  text: "No"),
            ],
          )
        ],
      ),
    );
  }
}
