import 'package:assist_teacher/colors.dart';
import 'package:flutter/material.dart';

class LongQuestions extends StatelessWidget {
  const LongQuestions({super.key});

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
              'Select Long Q\'s,  Each carry x Marks',
            ),
            for (var i = 0; i < 200; i++) Text('Long Q # $i'),
          ],
        ),
      ),
    );
  }
}
