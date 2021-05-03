import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

import 'package:escola_slide/models/managers/courses_manager.dart';
import 'package:escola_slide/models/entitys/course_entity.dart';

class CourseDetail extends StatefulWidget {
  final CourseEntity _courseItem;

  CourseDetail(this._courseItem);

  @override
  _CourseDetailState createState() => new _CourseDetailState();
}

class _CourseDetailState extends State<CourseDetail> {
  @override
  void initState() {
    super.initState();

    Provider.of<CoursesManager>(context, listen: false)
        .getCourseDetails(widget._courseItem);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CoursesManager>(builder: (_, coursesManager, __) {
      var courseItem = widget._courseItem;

      if (coursesManager.loading) {
        return Center(
          child: CircularProgressIndicator(
            valueColor:
                AlwaysStoppedAnimation<Color>(Theme.of(context).primaryColor),
          ),
        );
      }

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
              child: Container(
                width: double.infinity,
                height: double.infinity,
                child: ListView(
                  children: [
                    ListTile(
                      title: Text(courseItem.label),
                      subtitle: Text(courseItem.description),
                    ),
                    for (var content in courseItem.contents)
                      ListTile(
                        title: Text(content.label),
                        subtitle: Text(content.contentType),
                      )
                  ],
                ),
              ),
            ),
          )));
    });
  }
}
