import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:notely/constants/colors.dart';

class Logo extends StatelessWidget {
  const Logo({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      'NOTES APP',
      style: GoogleFonts.titanOne(
          fontSize: 20,
          fontWeight: FontWeight.w400,
          color: AppColors.headerText),
    );
  }
}

class Header1 extends StatelessWidget {
  final String text;
  final TextAlign textAlign;
  const Header1(
      {super.key, required this.text, this.textAlign = TextAlign.center});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.poppins(
          color: AppColors.headerText,
          fontSize: 24,
          fontWeight: FontWeight.w900),
      textAlign: textAlign,
    );
  }
}

class Header2 extends StatelessWidget {
  final String text;
  final TextAlign textAlign;

  const Header2(
      {super.key, required this.text, this.textAlign = TextAlign.center});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.poppins(
          color: AppColors.bodyText, fontSize: 18, fontWeight: FontWeight.w700),
      textAlign: textAlign,
    );
  }
}

class Header3 extends StatelessWidget {
  final String text;
  final TextAlign textAlign;

  const Header3(
      {super.key, required this.text, this.textAlign = TextAlign.center});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.poppins(
          color: AppColors.bodyText, fontSize: 16, fontWeight: FontWeight.w700),
      textAlign: textAlign,
    );
  }
}

class Header4 extends StatelessWidget {
  final String text;
  const Header4({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.poppins(
          color: AppColors.headerText,
          fontSize: 16,
          fontWeight: FontWeight.w900),
    );
  }
}

class Header5 extends StatelessWidget {
  final String text;
  const Header5({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.poppins(
          color: AppColors.bodyText, fontSize: 16, fontWeight: FontWeight.w700),
    );
  }
}

class ButtonText extends StatelessWidget {
  final String text;

  const ButtonText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.poppins(
          color: AppColors.offWhite, fontSize: 20, fontWeight: FontWeight.w900),
    );
  }
}

class ButtonText2 extends StatelessWidget {
  final String text;

  const ButtonText2({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.poppins(
          color: AppColors.accent, fontSize: 16, fontWeight: FontWeight.w800),
    );
  }
}
