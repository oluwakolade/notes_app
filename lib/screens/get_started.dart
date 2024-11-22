import 'package:flutter/material.dart';
import 'package:notely/components/app_bar.dart';
import 'package:notely/components/button.dart';
import 'package:notely/constants/colors.dart';
import 'package:notely/constants/text.dart';
import 'package:notely/screens/create_account.dart';
import 'package:notely/screens/login.dart';

class GetStarted extends StatelessWidget {
  const GetStarted({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: const NotelyAppBar(widget: Logo()),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 50,
            ),
            Image.asset(
              "assets/images/get_started.png",
              height: 200,
            ),
            const SizedBox(
              height: 20,
            ),
            const Header1(text: "World's Safest And Largest Digital Notebook"),
            const SizedBox(
              height: 15,
            ),
            const Header3(
                text:
                    "Notely is the world’s safest, largest and intelligent digital notebook. Join over 10M+ users already using Notely."),
            const Spacer(),
            AppButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const CreateAccount(),
                    ),
                  );
                },
                text: "GET STARTED"),
            const SizedBox(
              height: 10,
            ),
            AppTextButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const Login(),
                  ),
                );
              },
              text: "Already have an account?",
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
