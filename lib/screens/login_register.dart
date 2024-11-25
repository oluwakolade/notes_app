import 'package:flutter/material.dart';
import 'package:notely/screens/registration_screen.dart';
import 'package:notely/screens/login.dart';

class LoginorRegister extends StatefulWidget {
  const LoginorRegister({super.key});

  @override
  State<LoginorRegister> createState() => _LoginorRegisterState();
}

class _LoginorRegisterState extends State<LoginorRegister> {
  bool showLoginPage = true;

  void togglePages() {
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showLoginPage) {
      return Login(onTap: togglePages);
    } else {
      return RegistrationScreen(
        onTap: togglePages,
      );
    }
  }
}
