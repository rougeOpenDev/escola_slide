import 'dart:developer';

import 'package:escola_slide/views/course_detail.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

import 'package:escola_slide/models/managers/courses_list_manager.dart';
import 'package:escola_slide/models/managers/courses_manager.dart';
import 'package:escola_slide/models/entitys/course_entity.dart';
import 'package:escola_slide/views/course_list_item.dart';

class CoursesPage extends StatefulWidget {
  @override
  _CoursesPageState createState() => new _CoursesPageState();
}

class _CoursesPageState extends State<CoursesPage> {
  int _currentCourseIndex = null;
  List<CourseEntity> _courseItems;

  @override
  void initState() {
    super.initState();

    Provider.of<CoursesManager>(context, listen: false).getAllCourses();
  }

  void onTabTapped(int index) {
    setState(() {
      _currentCourseIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    var columnCount = 2;

    return Consumer<CoursesManager>(builder: (_, coursesManager, __) {
      _courseItems = coursesManager.courses;

      if (coursesManager.loading) {
        return Center(
          child: CircularProgressIndicator(
            valueColor:
                AlwaysStoppedAnimation<Color>(Theme.of(context).primaryColor),
          ),
        );
      }

      if (_currentCourseIndex != -1) {
        log(_currentCourseIndex.toString());

        // return CourseDetail(_courseItems[_currentCourseIndex]);
      } else {
        log(_currentCourseIndex.toString());
      }

      return new Scaffold(
        appBar: new AppBar(
          title: new Text('Cursos'),
        ),
        body: SafeArea(
          child: AnimationLimiter(
            child: GridView.extent(
              primary: false,
              padding: const EdgeInsets.all(16),
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              maxCrossAxisExtent: 200.0,
              children: List.generate(
                _courseItems.length,
                (int index) {
                  return AnimationConfiguration.staggeredGrid(
                    position: index,
                    duration: const Duration(milliseconds: 375),
                    columnCount: columnCount,
                    child: SlideAnimation(
                      child: FadeInAnimation(
                          child: Padding(
                              padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                              child: Center(
                                  child: Card(
                                color: Theme.of(context).cardColor,
                                // RoundedRectangleBorder, BeveledRectangleBorder, StadiumBorder
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.vertical(
                                      bottom: Radius.circular(5.0),
                                      top: Radius.circular(5.0)),
                                ),
                                child: InkWell(
                                  splashColor: Colors.blue.withAlpha(30),
                                  onTap: () {
                                    log(_currentCourseIndex.toString());
                                    log(index.toString());
                                    onTabTapped(index);
                                  },
                                  child: Container(
                                    width: double.infinity,
                                    height: 100,
                                    child: Text(_courseItems[index].label),
                                  ),
                                ),
                              )))),
                    ),
                  );
                },
              ),
            ),
          ),
        ),
        /*
        AnimationLimiter(
          child: ListView.builder(
            itemCount: _courseItems.length,
            itemBuilder: (BuildContext context, int index) {
              return AnimationConfiguration.staggeredList(
                position: index,
                duration: const Duration(milliseconds: 375),
                child: ScaleAnimation(
                  child: FadeInAnimation(
                    child: new CourseListItem(_courseItems[index]),
                  ),
                ),
              );
            },
          ),
        ),
        */
      );
    });
  }
}
