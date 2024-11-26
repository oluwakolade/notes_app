import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:notely/authentication/auth_service.dart';
import 'package:notely/components/app_bar.dart';
import 'package:notely/components/button.dart';
import 'package:notely/components/text_field.dart';
import 'package:notely/constants/colors.dart';
import 'package:notely/constants/text.dart';
import 'package:notely/constants/validator.dart';

class RegistrationScreen extends StatefulWidget {
  final void Function()? onTap;
  const RegistrationScreen({super.key, required this.onTap});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final emailController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  void signUsersUp() async {
    // FORM VALIDATION
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
//FIREBASE AUTH
    try {
      if (passwordController.text == confirmPasswordController.text) {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text,
        );
        if (!mounted) return;
        Navigator.of(context).pop();
      } else {
        errorMessage("Password dont match");
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        errorMessage("Weak password");
      } else if (e.code == 'email-already-in-use') {
        errorMessage("Email already in Use");
      }
    } catch (e) {
      errorMessage(e.toString());
      if (!mounted) return;
    } finally {
      if (!mounted) {
        Navigator.of(context).pop();
      }
    }
  }

//ERROR MESSAGE
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
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                    const Header1(text: "Register to save your notes"),
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
                      //EMAIL
                      AppTextField(
                          controller: emailController,
                          label: "Email Address",
                          validator: Validator.emailValidator),
                      const SizedBox(
                        height: 10,
                      ),
                      //PASSWORD
                      AppTextField(
                          controller: passwordController,
                          label: "Password",
                          validator: Validator.passwordValidator),

                      const SizedBox(
                        height: 10,
                      ),
                      //CONFIRM PASSWORD
                      AppTextField(
                          controller: confirmPasswordController,
                          label: "Confirm Password",
                          validator: Validator.passwordValidator),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                //APPBUTTONS
                Column(
                  children: [
                    AppButton(onPressed: signUsersUp, text: "Register"),
                    const SizedBox(
                      height: 20,
                    ),
                    GoogleButton(
                      onPressed: () => AuthService().signInWithGoogle(),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    AppTextButton(
                        onPressed: widget.onTap,
                        text: "Already have an Acount?"),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
