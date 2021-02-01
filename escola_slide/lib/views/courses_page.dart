import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

import 'package:escola_slide/models/entitys/course_entity.dart';
import 'package:escola_slide/models/course_repository.dart';
import 'package:escola_slide/views/course_list_item.dart';

class CoursesPage extends StatefulWidget {
  @override
  _CoursesPageState createState() => new _CoursesPageState();
}

class _CoursesPageState extends State<CoursesPage> {
  final _courseRepository = CourseRepository();
  List<CourseEntity> _courseItems;

  @override
  void initState() {
    super.initState();
    _courseItems = _courseRepository.getUserCourses();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Cursos'),
      ),
      body: AnimationLimiter(
        child: ListView.builder(
          itemCount: _courseItems.length,
          itemBuilder: (BuildContext context, int index) {
            return AnimationConfiguration.staggeredList(
              position: index,
              duration: const Duration(milliseconds: 375),
              child: ScaleAnimation(
                child: FadeInAnimation(
                  child: new CouseListItem(_courseItems[index]),
                ),
              ),
            );
          },
        ),
      ),
    );
/*
      body: new ListView.builder(
        itemCount: _courseItems.length,
        itemBuilder: (context, index) {

          var carSurveyItem = _courseItems[index];
          return new Card(

            color: Theme.of(context).cardColor,
            //RoundedRectangleBorder, BeveledRectangleBorder, StadiumBorder
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(10.0),
                  top: Radius.circular(2.0)),
            ),
            child: new UserCarSurveyItem(
              carSurveyItem
            )
          );
        },
      )
    );
*/
  }
}
