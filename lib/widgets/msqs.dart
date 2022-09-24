import 'package:assist_teacher/colors.dart';
import 'package:flutter/material.dart';

class MCQS extends StatelessWidget {
  const MCQS({super.key});

  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;
    final deviceHeight = MediaQuery.of(context).size.height;

    return SingleChildScrollView(
      child: Container(
        width: deviceWidth,
        height: deviceHeight - 239,
        color: MyColors.myWhite,
        child: ListView(
          children: [
            const Text(
              'Select MCQ\'s,  Each carry 1 Marks',
            ),
            for (var i = 0; i < 200; i++) Text('MCQ # $i'),
          ],
        ),
      ),
    );
  }
}
