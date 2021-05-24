import 'package:google_fonts/google_fonts.dart';
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
  bool _isSelectedCouse = false;

  final String _textSelectedCouse = 'Inscrito';
  final IconData _iconSelectedCouse = Icons.check_circle_outline;

  final String _textNonSelectedCouse = 'Inscrever-se';
  final IconData _iconNonSelectedCouse = Icons.panorama_fish_eye;

  @override
  void initState() {
    super.initState();

    Provider.of<CoursesManager>(context, listen: false)
        .getCourseDetails(widget._courseItem);
  }

  void onSelectCourse() {
    setState(() {
      this._isSelectedCouse = !this._isSelectedCouse;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CoursesManager>(builder: (_, coursesManager, __) {
      var courseItem = coursesManager.courseDetail;

      if (coursesManager.loading) {
        return Scaffold(
            appBar: AppBar(
                title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                          alignment: Alignment.topLeft,
                          margin: const EdgeInsets.only(left: 10.0),
                          child: Text(
                            'Escola de Slide',
                            style: TextStyle(
                                fontSize: 30.0,
                                fontFamily: GoogleFonts.lobster().fontFamily,
                                fontWeight: FontWeight.w400),
                          ))
                    ]),
                automaticallyImplyLeading: false),
            body: Scaffold(
                appBar: new AppBar(
                  title: new Text(widget._courseItem.label),
                ),
                body: Center(
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(
                        Theme.of(context).primaryColor),
                  ),
                )));
      }

      return Scaffold(
          appBar: AppBar(
              title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                        alignment: Alignment.topLeft,
                        margin: const EdgeInsets.only(left: 10.0),
                        child: Text(
                          'Escola de Slide',
                          style: TextStyle(
                              fontSize: 30.0,
                              fontFamily: GoogleFonts.lobster().fontFamily,
                              fontWeight: FontWeight.w400),
                        ))
                  ]),
              automaticallyImplyLeading: false),
          body: Scaffold(
              appBar: new AppBar(
                title: new Text(widget._courseItem.label),
              ),
              body: Padding(
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
                      child: Container(
                        width: double.infinity,
                        height: double.infinity,
                        child: ListView(
                          children: [
                            Card(
                                color: Theme.of(context).cardColor,
                                // RoundedRectangleBorder, BeveledRectangleBorder, StadiumBorder
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.vertical(
                                      bottom: Radius.circular(5.0),
                                      top: Radius.circular(5.0)),
                                ),
                                child: ListTile(
                                    trailing: Wrap(
                                      alignment: WrapAlignment.center,
                                      spacing: 12, // space between two icons
                                      children: <Widget>[
                                        RaisedButton.icon(
                                            onPressed: onSelectCourse,
                                            icon: this._isSelectedCouse
                                                ? Icon(this._iconSelectedCouse)
                                                : Icon(
                                                    this._iconNonSelectedCouse),
                                            label: Text(
                                                this._isSelectedCouse
                                                    ? this._textSelectedCouse
                                                    : this
                                                        ._textNonSelectedCouse,
                                                style:
                                                    TextStyle(fontSize: 18.0))),
                                      ],
                                    ),
                                    subtitle: Text(courseItem.description),
                                    title: Text('Curso: ' + courseItem.label,
                                        style: TextStyle(
                                            fontSize: 18.0,
                                            fontFamily: GoogleFonts.lobster()
                                                .fontFamily,
                                            fontWeight: FontWeight.w200)))),
                            ListTile(
                                title: Text('Aulas:',
                                    style: TextStyle(
                                        fontSize: 18.0,
                                        fontFamily:
                                            GoogleFonts.lobster().fontFamily,
                                        fontWeight: FontWeight.w200))),
                            for (var content in courseItem.contents)
                              ListTile(
                                title: Text(content.label),
                                subtitle: Text(content.contentType),
                              )
                          ],
                        ),
                      ),
                    ),
                  )))));
    });
  }
}
