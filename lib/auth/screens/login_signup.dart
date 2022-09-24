import 'package:assist_teacher/auth/features/auth_card.dart';
import 'package:assist_teacher/colors.dart';
import 'package:flutter/material.dart';

class SignupLogin extends StatelessWidget {
  const SignupLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 30, 8, 0),
              child: Container(
                child: const Text(
                  'Welcome to Teacher Assist',
                  style: TextStyle(
                    color: MyColors.myWhite,
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 20, 8, 0),
              child: Container(
                width: 200,
                height: 200,
                child: Image.asset(
                  "assets/images/tlogo.png",
                  fit: BoxFit.contain,
                ),
              ),
            ),
            const SizedBox(height: 30),
            const AuthCard(),
          ]),
        ),
      ),
    );
  }
}
