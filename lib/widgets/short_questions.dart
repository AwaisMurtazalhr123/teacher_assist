import 'package:assist_teacher/colors.dart';
import 'package:flutter/material.dart';

class ShortQuestions extends StatelessWidget {
  const ShortQuestions({super.key});

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
              'Select  Short Q\'s,  Each carry 2 Marks',
            ),
            for (var i = 0; i < 200; i++) Text('Short Q # $i'),
          ],
        ),
      ),
    );
  }
}
