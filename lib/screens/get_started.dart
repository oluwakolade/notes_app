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
        padding:
            const EdgeInsets.only(left: 20, right: 20, top: 30, bottom: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            //APP LOGO
            const Logo(),
            Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
              //INTRO AND ANIMATION
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
              const Header1(
                  text: "Start your journey today—one note at a time"),
            ]),
            //GET STARTED BUTTON
            AppButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const AuthPage(),
                    ),
                  );
                },
                text: "Get Started"),
          ],
        ),
      ),
    );
  }
}
