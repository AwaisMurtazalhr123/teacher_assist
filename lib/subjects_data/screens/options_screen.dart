import 'package:assist_teacher/colors.dart';
import 'package:assist_teacher/utils/lists_chapters.dart';
import 'package:assist_teacher/subjects_data/screens/test_selection_screen.dart';
import 'package:assist_teacher/widgets/list_tile.dart';
import 'package:assist_teacher/widgets/drawer.dart';
import 'package:flutter/material.dart';

class OptionsScreen extends StatelessWidget {
  static const routeName = 'options-screen';
  final ChLists chLists = ChLists();
  OptionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.pushNamed(context, TestSelectionScreen.routeName);
            },
            icon: const Icon(
              Icons.list_alt_outlined,
            ),
            tooltip: 'Generate Test',
          ),
          elevation: 0,
          title: const Text(
            'Please Select Chapter(s)/Syllabus',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          backgroundColor: MyColors.myPink,
        ),

        // endDrawer: const AppDrawer(),
        body: ListView(
          children: [
            for (int i = 0; i < chLists.phy9th.length; i++)
              ListTileCh(text: chLists.phy9th[i])
          ],
        ));
  }
}
