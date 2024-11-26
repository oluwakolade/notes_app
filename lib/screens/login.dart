import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:notely/components/app_bar.dart';
import 'package:notely/components/button.dart';
import 'package:notely/components/text_field.dart';
import 'package:notely/constants/colors.dart';
import 'package:notely/constants/text.dart';
import 'package:notely/constants/validator.dart';

class Login extends StatefulWidget {
  final void Function()? onTap;
  const Login({super.key, required this.onTap});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  void signUsersIn() async {
    //FORM VALIDATOR LOGIC
    if (formKey.currentState == null || !formKey.currentState!.validate()) {
      return;
    }
    //LOADING SPINNER
    showDialog(
        context: context,
        builder: (context) {
          return const Center(
            child: CircularProgressIndicator(
              color: AppColors.offWhite,
            ),
          );
        });
//AUTHENTICATION LOGIC WITH FIREBASE
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);
      if (!mounted) return;
      Navigator.pop(context, mounted);
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);
      if (e.code == 'user-not-found') {
        errorMessage("Incorrect Email");
      } else if (e.code == 'wrong-password') {
        errorMessage("Incorrect Password");
      }
    }
  }

//ERROR MESSAGE FOR TEXTFIELD
  void errorMessage(String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          message,
          style: GoogleFonts.poppins(color: Colors.red),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: const NotesAppBar(widget: Logo()),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                //HEADER AND ANIMATION
                Column(
                  children: [
                    Lottie.asset(
                      "assets/login_signup.json",
                      height: 150,
                      repeat: true,
                      animate: true,
                      reverse: true,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Header1(text: "Sign in to access your saved notes"),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                //FORM
                Form(
                  key: formKey,
                  child: Column(
                    children: [
                      //EMAIL TEXTFIELD
                      AppTextField(
                        controller: emailController,
                        label: "Email Address",
                        validator: Validator.emailValidator,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      //PASSWORD TEXTFIELD
                      AppTextField(
                        controller: passwordController,
                        label: "Password",
                        validator: Validator.passwordValidator,
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                    ],
                  ),
                ),

                //APP BUTTONS
                Column(
                  children: [
                    AppButton(onPressed: signUsersIn, text: "Sign In"),
                    const SizedBox(
                      height: 10,
                    ),
                    AppTextButton(
                        onPressed: widget.onTap,
                        text: "Don't have an account?"),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
