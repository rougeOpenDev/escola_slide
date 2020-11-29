import 'package:flutter/material.dart';

import 'package:frete_facil/models/entitys/user_car_survey_entity.dart';
import 'package:frete_facil/models/user_car_survey_repository.dart';

class UserCarSurveyItem extends StatelessWidget {
  
  final UserCarSurveyEntity _userCarSurveyItem;

  UserCarSurveyItem(this._userCarSurveyItem);
 
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
              bottom: Radius.circular(5.0),
              top: Radius.circular(5.0)),
          ),
          child: InkWell(
            splashColor: Colors.blue.withAlpha(30),
            onTap: () {
              print('Card tapped.');
            },
            child: Container(
              width: double.infinity, 
              height: 100,
              child: Text(_userCarSurveyItem.description),
            ),
          ),
        )
      )
    );
  }
}