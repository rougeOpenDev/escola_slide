import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

import 'package:frete_facil/models/entitys/user_car_survey_entity.dart';
import 'package:frete_facil/models/user_car_survey_repository.dart';
import 'package:frete_facil/views/user_car_survey_item.dart';

class HomePage extends StatefulWidget {
  
  @override
  _HomePageState createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> {
  
  final _userCarSurveyRepository = UserCarSurveyRepository();
  List<UserCarSurveyEntity> _userCarSurveyItems;

  @override
  void initState() {

    super.initState();
    _userCarSurveyItems =  _userCarSurveyRepository.getUserCarSurveys();
  }

  
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('interno'),
      ),
      body: AnimationLimiter(
      child: ListView.builder(

        itemCount: _userCarSurveyItems.length,
        itemBuilder: (BuildContext context, int index) {

          return AnimationConfiguration.staggeredList(
  
            position: index,
            duration: const Duration(milliseconds: 375),
            child: ScaleAnimation(
              child: FadeInAnimation(
                child: new UserCarSurveyItem(
                  _userCarSurveyItems[index]
                ),
              ),
            ),
          );
        },
      ),
    ),
  );
/*
      body: new ListView.builder(
        itemCount: _userCarSurveyItems.length,
        itemBuilder: (context, index) {

          var carSurveyItem = _userCarSurveyItems[index];
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