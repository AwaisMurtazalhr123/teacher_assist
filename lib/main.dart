import 'package:assist_teacher/auth/screens/login_signup.dart';
import 'package:assist_teacher/classes/screens/main_classes_screen.dart';
import 'package:assist_teacher/colors.dart';
import 'package:assist_teacher/home/screens/home_screen.dart';
import 'package:assist_teacher/subjects_data/screens/auto_test_screen.dart';
import 'package:assist_teacher/subjects_data/screens/options_screen.dart';
import 'package:assist_teacher/subjects_data/screens/test_selection_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Teacher Assist',
      theme: ThemeData(
        scaffoldBackgroundColor: MyColors.myGreen,
      ),
      home: const SignupLogin(),
      routes: {
        BoardSelectPage.routeName: (ctx) => const BoardSelectPage(),
        ClassesMainPage.routeName: (ctx) => const ClassesMainPage(),
        OptionsScreen.routeName: (ctx) => OptionsScreen(),
        AutoTestScreen.routeName: (ctx) => const AutoTestScreen(),
        TestSelectionScreen.routeName: (ctx) => const TestSelectionScreen(),
      },
    );
  }
}
