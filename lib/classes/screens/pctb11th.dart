import 'package:assist_teacher/classes/subject_lists.dart/pctb.dart';
import 'package:assist_teacher/widgets/class_card.dart';
import 'package:flutter/material.dart';

class Pctb11th extends StatelessWidget {
  final PctbSubjectLists lists = PctbSubjectLists();

  Pctb11th({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          for (int i = 0; i < lists.list_11th.length; i++)
            ClassCard(text: lists.list_11th[i]),
        ],
      ),
    );
  }
}
