import 'package:assist_teacher/subjects_data/screens/options_screen.dart';
import 'package:assist_teacher/widgets/class_card.dart';
import 'package:flutter/material.dart';

class Pctb9th extends StatelessWidget {
  const Pctb9th({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      children: [
        GestureDetector(
          onTap: () => Navigator.pushNamed(context, OptionsScreen.routeName),
          child: const ClassCard(text: 'Physics'),
        ),
        const ClassCard(text: 'Urdu'),
        const ClassCard(text: 'English'),
        const ClassCard(text: 'Islamic Studies'),
        const ClassCard(text: 'Pakistan Studies'),
        const ClassCard(text: 'Mathematics'),
        const ClassCard(text: 'Chemistry'),
        const ClassCard(text: 'Biology'),
        const ClassCard(text: 'Genral Mathematics'),
        const ClassCard(text: 'Mathematics(UM)'),
        const ClassCard(text: 'Physics(UM)'),
        const ClassCard(text: 'Chemistry(UM)'),
        const ClassCard(text: 'Biology(UM)'),
        const ClassCard(text: 'Genral Mathematics(UM)'),
        const ClassCard(text: 'TARJUMA-TUL-QURAN'),
        const ClassCard(text: 'Computer Science'),
        const ClassCard(text: 'Computer Science(UM)'),
        const ClassCard(text: 'Computer Science(P)'),
        const ClassCard(text: 'Akhlaqiat 9-10(optional)'),
        const ClassCard(text: 'Farsi 9-10'),
        const ClassCard(text: 'General Science(EM)9-10'),
        const ClassCard(text: 'General Science(UM)9-10'),
      ],
    ));
  }
}
