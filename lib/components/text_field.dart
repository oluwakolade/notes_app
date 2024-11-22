import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:notely/constants/colors.dart';
import 'package:notely/constants/text.dart';

class AppTextField extends StatelessWidget {
  final TextEditingController controller;
  final String errorText;
  final String label;
  const AppTextField(
      {super.key,
      required this.controller,
      required this.errorText,
      required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Header5(text: label),
        const SizedBox(
          height: 10,
        ),
        TextFormField(
          controller: controller,
          // forceErrorText: errorText,
          autocorrect: false,
          style: GoogleFonts.nunito(
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: AppColors.headerText),
          decoration: InputDecoration(
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            fillColor: AppColors.offWhite,
            filled: true,
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.red),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      ],
    );
  }
}
