import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

import 'package:escola_slide/models/managers/courses_manager.dart';
import 'package:escola_slide/models/entitys/course_entity.dart';
import 'package:escola_slide/views/course_list_item.dart';

class CoursesPage extends StatefulWidget {
  @override
  _CoursesPageState createState() => new _CoursesPageState();
}

class _CoursesPageState extends State<CoursesPage> {
  int _currentCourseIndex = 0;
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
                        child: new CourseListItem(_courseItems[index]),
                      ),
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
