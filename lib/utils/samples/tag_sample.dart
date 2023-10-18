import 'package:flutter/material.dart';

import '../consts/colors.dart';
import '../enums/tags_list.dart';

class TagSample extends StatefulWidget {
  TagSample({Key? key, required this.index}) : super(key: key);
  final int index;
  bool isTuped = false;

  @override
  State<TagSample> createState() => _TagSampleState();
}

class _TagSampleState extends State<TagSample> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
      child: GestureDetector(
        onTap: () {
          setState(() {
            widget.isTuped = !widget.isTuped;
          });
        },
        child: Container(
          decoration: !widget.isTuped ? BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            border: Border.all(color: borderColor),
          ) : BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: secondColor
          ),
          child:  Padding(
            padding: const EdgeInsets.all(8.0),
            child:!widget.isTuped ? Text(TagsList.tagsList[widget.index].title) : Text(TagsList.tagsList[widget.index].title, style: TextStyle(color: Colors.white),),
          ),
        ),
      ),
    );
  }
}
