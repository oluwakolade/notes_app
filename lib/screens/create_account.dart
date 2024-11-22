import 'package:flutter/material.dart';
import 'package:notely/components/app_bar.dart';
import 'package:notely/components/button.dart';
import 'package:notely/components/text_field.dart';
import 'package:notely/constants/colors.dart';
import 'package:notely/constants/text.dart';
import 'package:notely/screens/login.dart';
import 'package:notely/screens/recent_notes.dart';

class CreateAccount extends StatefulWidget {
  const CreateAccount({super.key});

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: const NotelyAppBar(widget: Logo()),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Header1(text: "Create a free account"),
              const SizedBox(
                height: 10,
              ),
              const Header3(
                  text:
                      "Join Notely for free. Create and share unlimited notes with your friends"),
              const SizedBox(
                height: 30,
              ),
              Form(
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.7,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      //full name
                      AppTextField(
                          controller: nameController,
                          errorText: "Invalid name",
                          label: "Full Name"),
                      const SizedBox(
                        height: 10,
                      ),
                      //email address
                      AppTextField(
                          controller: emailController,
                          errorText: "Invalid email address",
                          label: "Email Address"),
                      const SizedBox(
                        height: 10,
                      ),
                      //password
                      AppTextField(
                          controller: passwordController,
                          errorText: "Invalid passowrd",
                          label: "Password"),
                      const Spacer(),
                      AppButton(
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => const RecentNotes(),
                              ),
                            );
                          },
                          text: "Create Account"),
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
                          text: "Already have an account?"),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
