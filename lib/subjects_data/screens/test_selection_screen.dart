import 'package:assist_teacher/colors.dart';
import 'package:assist_teacher/subjects_data/screens/auto_test_screen.dart';
import 'package:assist_teacher/utils/show_snack_bar.dart';
import 'package:assist_teacher/widgets/custom_test_selection.dart';
import 'package:assist_teacher/widgets/long_questions.dart';
import 'package:assist_teacher/widgets/marks_counter.dart';
import 'package:assist_teacher/widgets/msqs.dart';
import 'package:assist_teacher/widgets/short_questions.dart';
import 'package:flutter/material.dart';

class TestSelectionScreen extends StatefulWidget {
  static const routeName = 'test-selection-page';
  const TestSelectionScreen({super.key});

  @override
  State<TestSelectionScreen> createState() => _TestSelectionScreenState();
}

class _TestSelectionScreenState extends State<TestSelectionScreen> {
  TextEditingController marksController = TextEditingController();
  final List<bool> _selected = List.generate(2, (_) => false);
  bool isCustom = false;
  int selectedIndex = 0;

  @override
  void dispose() {
    super.dispose();
    marksController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;

    return Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  // margin: const EdgeInsets.all(15),
                  padding: const EdgeInsets.all(10),
                  width: deviceWidth,
                  height: 116,
                  color: MyColors.myPink,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Select Test Type',
                            style: TextStyle(
                              fontSize: 24,
                              color: MyColors.myWhite,
                            ),
                          ),
                          ToggleButtons(
                            onPressed: (index) {
                              setState(() {
                                for (int i = 0; i < _selected.length; i++) {
                                  if (i == index) {
                                    _selected[i] = true;
                                  } else {
                                    _selected[i] = false;
                                  }
                                }
                              });
                            },

                            isSelected: _selected,
                            selectedColor: MyColors.myWhite,
                            fillColor: MyColors.myGreen,
                            borderRadius: BorderRadius.circular(12),
                            borderWidth: 3,
                            borderColor: Colors.black,
                            selectedBorderColor: MyColors.myWhite,

                            // renderBorder: false,
                            children: const [
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                  'Auto',
                                  style: TextStyle(
                                      fontSize: 24, letterSpacing: 1.8),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                  'Custom',
                                  style: TextStyle(
                                      fontSize: 24, letterSpacing: 1.8),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                      const SizedBox(height: 2),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Type Marks',
                            style: TextStyle(
                              fontSize: 24,
                              color: MyColors.myWhite,
                            ),
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  border: Border.all(),
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                width: deviceWidth * 0.43,
                                height: 36,
                                child: TextFormField(
                                  onFieldSubmitted: (value) {
                                    value;
                                  },
                                  controller: marksController,
                                  textAlignVertical: TextAlignVertical.bottom,
                                  style: const TextStyle(
                                      color: Colors.black, fontSize: 20),
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                      suffixIcon: IconButton(
                                        padding:
                                            const EdgeInsets.only(bottom: 2),
                                        alignment: Alignment.center,
                                        onPressed: () {
                                          if (marksController.text.isEmpty) {
                                            showSnackBar(context,
                                                'Please Enter A value');
                                          }

                                          if (_selected.first &&
                                              marksController.text.isNotEmpty) {
                                            Navigator.pushNamed(context,
                                                AutoTestScreen.routeName);
                                            setState(() {
                                              isCustom = false;
                                            });
                                          }
                                          if (_selected.last &&
                                              marksController.text.isNotEmpty) {
                                            setState(() {
                                              isCustom = true;
                                            });
                                          }

                                          print(marksController.text);
                                        },
                                        icon: const Icon(
                                          Icons.done_outline,
                                          color: Colors.black,
                                          size: 32,
                                        ),
                                      ),
                                      hintText: '60',
                                      hintStyle: TextStyle(
                                        color: Colors.grey.shade400,
                                      ),
                                      filled: true,
                                      fillColor: MyColors.myWhite),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                if (isCustom == true)
                  MarksCounter(
                    totalMarks: int.parse(marksController.text),
                  ),
                if (selectedIndex == 0 && _selected.last) const MCQS(),
                if (selectedIndex == 1 && _selected.last)
                  const ShortQuestions(),
                if (selectedIndex == 2 && _selected.last) const LongQuestions(),
              ],
            ),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: MyColors.myPink,
          selectedItemColor: MyColors.myWhite,
          unselectedItemColor: Colors.grey,
          selectedFontSize: 18,
          unselectedFontSize: 14,
          elevation: 0,
          iconSize: 26,
          currentIndex: selectedIndex,
          onTap: (value) {
            setState(() {
              selectedIndex = value;
            });
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.mark_chat_read),
              label: 'MCQ\'s',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.mark_chat_read),
              label: 'short Q\'s',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.mark_chat_read),
              label: 'Long Q\'s',
            ),
          ],
        ));
  }
}
