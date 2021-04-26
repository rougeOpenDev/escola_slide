import 'package:escola_slide/views/login/login_screen_3.dart';
import 'package:escola_slide/views/user_page.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:escola_slide/blocs/authentication_bloc.dart';
import 'package:escola_slide/events/authentication_event.dart';
import 'package:escola_slide/views/confetti_page.dart';
import 'package:escola_slide/views/history_page.dart';
import 'package:escola_slide/views/courses_page.dart';
import 'package:google_fonts/google_fonts.dart';

class PrincipalPage extends StatefulWidget {
  _PrincipalPage createState() => _PrincipalPage();
}

class _PrincipalPage extends State<PrincipalPage> {
  int _currentIndex = 0;
  final List<Widget> _children = [CoursesPage(), ConfettiPage(), UserPage()];

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Container(
            alignment: Alignment.topLeft,
            margin: const EdgeInsets.only(left: 10.0),
            child: Text(
              'Escola de Slide',
              style: TextStyle(
                  fontSize: 30.0,
                  fontFamily: GoogleFonts.lobster().fontFamily,
                  fontWeight: FontWeight.w400),
            )),
        Container(
            margin: const EdgeInsets.only(left: 10.0),
            alignment: Alignment.topRight,
            child: Icon(Icons.favorite_border))
      ])),
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          onTap: onTabTapped,
          currentIndex: _currentIndex,
          type: BottomNavigationBarType.fixed,
          items: [
            new BottomNavigationBarItem(
              icon: new Icon(Icons.menu),
              title: new Text("Aulas"),
            ),
            new BottomNavigationBarItem(
              icon: new Icon(Icons.home),
              title: new Text("Home"),
            ),
            new BottomNavigationBarItem(
              icon: new Icon(Icons.history),
              title: new Text("Seus Dados"),
            )
          ]),
    );
  }
}
