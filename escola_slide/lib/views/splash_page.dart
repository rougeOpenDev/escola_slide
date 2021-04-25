import 'package:flutter/material.dart';

import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:page_transition/page_transition.dart';
import 'package:splashscreen/splashscreen.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
/*
    return new SplashScreen(
      seconds: 13,
      navigateAfterSeconds: null,
      title: new Text(
        'Welcome In SplashScreen',
        style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
      ),
      image: Image.asset('images/escola_slide.png'),
      backgroundColor: Colors.white,
      loaderColor: Colors.red,
    );

/ * */
    var _size = MediaQuery.of(context).size;
    return AnimatedSplashScreen(
        splash: Image.asset('assets/images/escola_slide.png'),
        splashIconSize: _size.height / 2,
        nextScreen: null,
        splashTransition: SplashTransition.slideTransition,
        pageTransitionType: PageTransitionType.leftToRightWithFade);
  }
}
