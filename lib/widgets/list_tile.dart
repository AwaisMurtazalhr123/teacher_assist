// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:assist_teacher/colors.dart';

class ListTileCh extends StatefulWidget {
  final String text;
  const ListTileCh({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  State<ListTileCh> createState() => _ListTileChState();
}

class _ListTileChState extends State<ListTileCh> {
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: ListTile(
        leading: IconButton(
          onPressed: () => setState(() {
            isSelected = !isSelected;
          }),
          icon: Icon(
            !isSelected ? Icons.add_circle_outline : Icons.check_circle_outline,
            color: Colors.black,
          ),
        ),
        title: Text(
          widget.text,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        tileColor: MyColors.myWhite,
      ),
    );
  }
}
