import 'dart:ui';

import 'package:assist_teacher/classes/screens/main_classes_screen.dart';
import 'package:assist_teacher/colors.dart';
import 'package:flutter/material.dart';

class BoardSelectPage extends StatelessWidget {
  static const routeName = '/board-Selection';
  const BoardSelectPage({super.key});

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text(
          'Please Select Board',
          style: TextStyle(fontSize: 30),
        ),
        backgroundColor: MyColors.myPink,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: MyColors.myPink,
                      borderRadius: const BorderRadius.all(
                        Radius.circular(10),
                      ),
                      border: Border.all(width: 3, color: MyColors.myWhite),
                    ),
                    margin: EdgeInsets.symmetric(
                        horizontal: deviceSize * 0.04, vertical: 20),
                    padding: const EdgeInsets.fromLTRB(15, 20, 15, 10),
                    height: 200,
                    width: deviceSize * 0.42,
                    child: InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, ClassesMainPage.routeName);
                      },
                      child: Column(
                        children: [
                          Container(
                            width: 120,
                            height: 120,
                            child: Image.asset(
                              "assets/images/pctb.jpg",
                              fit: BoxFit.contain,
                            ),
                          ),
                          const Text(
                            'PCTB',
                            style: TextStyle(
                              letterSpacing: 2,
                              color: MyColors.myWhite,
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: MyColors.myPink,
                      borderRadius: const BorderRadius.all(
                        Radius.circular(10),
                      ),
                      border: Border.all(width: 3, color: MyColors.myWhite),
                    ),
                    margin: EdgeInsets.symmetric(
                        horizontal: deviceSize * 0.04, vertical: 20),
                    padding: const EdgeInsets.fromLTRB(15, 20, 15, 2),
                    height: 200,
                    width: deviceSize * 0.42,
                    child: Column(
                      children: [
                        Container(
                          width: 120,
                          height: 120,
                          child: Image.asset(
                            "assets/images/fb.png",
                            fit: BoxFit.contain,
                          ),
                        ),
                        const Text(
                          'Fedral \n Board',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            letterSpacing: 2,
                            color: MyColors.myWhite,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: MyColors.myPink,
                      borderRadius: const BorderRadius.all(
                        Radius.circular(10),
                      ),
                      border: Border.all(width: 3, color: MyColors.myWhite),
                    ),
                    margin: EdgeInsets.symmetric(
                        horizontal: deviceSize * 0.04, vertical: 20),
                    padding: const EdgeInsets.fromLTRB(15, 20, 15, 10),
                    height: 200,
                    width: deviceSize * 0.42,
                    child: Column(
                      children: [
                        Container(
                          width: 120,
                          height: 120,
                          child: Image.asset(
                            "assets/images/kptb.jpg",
                            fit: BoxFit.contain,
                          ),
                        ),
                        const Text(
                          'KPTB',
                          style: TextStyle(
                            letterSpacing: 2,
                            color: MyColors.myWhite,
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: MyColors.myPink,
                      borderRadius: const BorderRadius.all(
                        Radius.circular(10),
                      ),
                      border: Border.all(width: 3, color: MyColors.myWhite),
                    ),
                    margin: EdgeInsets.symmetric(
                        horizontal: deviceSize * 0.04, vertical: 20),
                    padding: const EdgeInsets.fromLTRB(15, 20, 15, 2),
                    height: 200,
                    width: deviceSize * 0.42,
                    child: Column(
                      children: [
                        Container(
                          width: 120,
                          height: 120,
                          child: Image.asset(
                            "assets/images/stb.png",
                            fit: BoxFit.contain,
                          ),
                        ),
                        const Text(
                          'Sindh \n Board',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            letterSpacing: 2,
                            color: MyColors.myWhite,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: MyColors.myPink,
                      borderRadius: const BorderRadius.all(
                        Radius.circular(10),
                      ),
                      border: Border.all(width: 3, color: MyColors.myWhite),
                    ),
                    margin: EdgeInsets.symmetric(
                        horizontal: deviceSize * 0.04, vertical: 20),
                    padding: const EdgeInsets.fromLTRB(15, 20, 15, 2),
                    height: 200,
                    width: deviceSize * 0.42,
                    child: Column(
                      children: [
                        Container(
                          width: 120,
                          height: 120,
                          child: Image.asset(
                            "assets/images/btb.jpg",
                            fit: BoxFit.contain,
                          ),
                        ),
                        const Text(
                          'Balochistan \n Board',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            letterSpacing: 2,
                            color: MyColors.myWhite,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: MyColors.myPink,
                      borderRadius: const BorderRadius.all(
                        Radius.circular(10),
                      ),
                      border: Border.all(width: 3, color: MyColors.myWhite),
                    ),
                    margin: EdgeInsets.symmetric(
                        horizontal: deviceSize * 0.04, vertical: 20),
                    padding: const EdgeInsets.fromLTRB(15, 20, 15, 10),
                    height: 200,
                    width: deviceSize * 0.42,
                    child: Column(
                      children: [
                        Container(
                          width: 120,
                          height: 120,
                          child: Image.asset(
                            "assets/images/igcse.jpg",
                            fit: BoxFit.contain,
                          ),
                        ),
                        const Text(
                          'IGCSE',
                          style: TextStyle(
                            letterSpacing: 2,
                            color: MyColors.myWhite,
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
