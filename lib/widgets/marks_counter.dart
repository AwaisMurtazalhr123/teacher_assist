// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:assist_teacher/colors.dart';

class MarksCounter extends StatelessWidget {
  final int totalMarks;
  final int selectedMarks = 0;
  const MarksCounter({
    Key? key,
    required this.totalMarks,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;
    return Container(
      width: deviceWidth,
      height: 30,
      color: MyColors.myPink,
      child: Row(
        children: [
          const Text(
            ' Total Marks =',
            style: TextStyle(fontSize: 24, color: Colors.black),
          ),
          Text(
            " $totalMarks",
            style: const TextStyle(
              color: MyColors.myWhite,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Text(
            '  Selected Marks = ',
            style: TextStyle(fontSize: 24, color: Colors.black),
          ),
          Text(
            " $selectedMarks",
            style: const TextStyle(
              color: MyColors.myWhite,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
