import 'package:assist_teacher/classes/screens/pctb10th.dart';
import 'package:assist_teacher/classes/screens/pctb11th.dart';
import 'package:assist_teacher/classes/screens/pctb12th.dart';
import 'package:assist_teacher/classes/screens/pctb9th.dart';
import 'package:assist_teacher/colors.dart';
import 'package:flutter/material.dart';

class ClassesMainPage extends StatefulWidget {
  static const routeName = 'classes-mainpage';
  const ClassesMainPage({super.key});

  @override
  State<ClassesMainPage> createState() => _ClassesMainPageState();
}

class _ClassesMainPageState extends State<ClassesMainPage> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    final tabs = [
      const Pctb9th(),
      Pctb10th(),
      Pctb11th(),
      Pctb12th(),
    ];
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text(
          'Please Select Subject',
          style: TextStyle(fontSize: 30),
        ),
        backgroundColor: MyColors.myPink,
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: MyColors.myPink,
        selectedItemColor: MyColors.myWhite,
        unselectedItemColor: Colors.grey,
        selectedFontSize: 18,
        unselectedFontSize: 14,
        elevation: 0,
        iconSize: 26,
        currentIndex: selectedIndex,
        onTap: (value) => setState(() {
          selectedIndex = value;
        }),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.note_add),
            label: '9th',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.note_add),
            label: '10th',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.note_add),
            label: '11th',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.note_add),
            label: '12th',
          ),
        ],
      ),
      body: tabs[selectedIndex],
    );
  }
}
