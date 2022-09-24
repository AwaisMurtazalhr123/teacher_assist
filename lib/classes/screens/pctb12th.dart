import 'package:assist_teacher/classes/subject_lists.dart/pctb.dart';
import 'package:assist_teacher/widgets/class_card.dart';
import 'package:flutter/material.dart';

class Pctb12th extends StatelessWidget {
  final PctbSubjectLists lists = PctbSubjectLists();

  Pctb12th({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          for (int i = 0; i < lists.list_12th.length; i++)
            ClassCard(text: lists.list_12th[i]),
        ],
      ),
    );
  }
}
