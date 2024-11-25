import 'package:flutter/material.dart';
import 'package:notely/authentication/auth_page.dart';
import 'package:notely/components/button.dart';
import 'package:notely/constants/colors.dart';
import 'package:notely/constants/text.dart';
import 'package:lottie/lottie.dart';

class GetStarted extends StatelessWidget {
  const GetStarted({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 40,
            ),
            const Logo(),
            const SizedBox(
              height: 40,
            ),
            Lottie.asset(
              "assets/get_started.json",
              height: 300,
              repeat: true,
              animate: true,
              reverse: true,
            ),
            const SizedBox(
              height: 20,
            ),
            const Header1(text: "Start your journey today—one note at a time"),
            const SizedBox(
              height: 15,
            ),
            const Spacer(),
            AppButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const AuthPage(),
                    ),
                  );
                },
                text: "Get Started"),
            const SizedBox(
              height: 10,
            ),
            const SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }
}
