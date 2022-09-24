import 'package:assist_teacher/colors.dart';
import 'package:flutter/material.dart';

// not in use for now
class AutoTestScreen extends StatelessWidget {
  static const routeName = 'auto-test';
  const AutoTestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Container(
            color: MyColors.myPink,
            width: 200,
            height: 200,
            child: const Center(
              child: Text(
                'Auto Test Genration API Call',
                style: TextStyle(fontSize: 24),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
