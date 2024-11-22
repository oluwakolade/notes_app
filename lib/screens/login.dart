import 'package:flutter/material.dart';
import 'package:notely/components/app_bar.dart';
import 'package:notely/components/button.dart';
import 'package:notely/components/text_field.dart';
import 'package:notely/constants/colors.dart';
import 'package:notely/constants/text.dart';
import 'package:notely/screens/create_account.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
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
            children: [
              const Header1(text: "Login"),
              const SizedBox(
                height: 10,
              ),
              const Header3(
                  text:
                      "We are happy to have you back.Please login with your email to continue."),
              const SizedBox(
                height: 30,
              ),
              Form(
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.7,
                  child: Column(
                    children: [
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

                      AppButton(onPressed: () {}, text: "Login"),
                      const SizedBox(
                        height: 10,
                      ),

                      AppTextButton(
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => const CreateAccount(),
                              ),
                            );
                          },
                          text: "Don't have an account?"),
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
