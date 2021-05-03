import 'package:escola_slide/views/course_detail.dart';
import 'package:flutter/material.dart';

import 'package:escola_slide/models/entitys/course_entity.dart';

class CourseListItem extends StatelessWidget {
  final CourseEntity _courseItem;

  CourseListItem(this._courseItem);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
        child: Center(
            child: Card(
          color: Theme.of(context).cardColor,
          // RoundedRectangleBorder, BeveledRectangleBorder, StadiumBorder
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(5.0), top: Radius.circular(5.0)),
          ),
          child: InkWell(
            splashColor: Colors.blue.withAlpha(30),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) {
                  return CourseDetail(_courseItem);
                }),
              );
            },
            child: Container(
              width: double.infinity,
              height: 100,
              child: Text(_courseItem.label),
            ),
          ),
        )));
  }
}
