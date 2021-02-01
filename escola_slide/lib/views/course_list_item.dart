import 'package:flutter/material.dart';

import 'package:escola_slide/models/entitys/course_entity.dart';

class CouseListItem extends StatelessWidget {
  final CourseEntity _courseItem;

  CouseListItem(this._courseItem);

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
              print('Card tapped.');
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
