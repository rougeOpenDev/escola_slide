import 'package:frete_facil/models/entitys/user_car_entity.dart';
import 'package:frete_facil/models/entitys/user_car_survey_entity.dart';

class UserCarSurveyRepository {

  List<UserCarSurveyEntity> userCarSurveyItems;

  UserCarSurveyRepository({this.userCarSurveyItems});

  List<UserCarSurveyEntity> getUserCarSurveys() =>
    <UserCarSurveyEntity>[
      UserCarSurveyEntity(
        id: 'id1',
        refNo: 'refNo1',
        description: 'description 1 1 1  1 ola',
        assignTime: '20201005121413',
        car: 'car',
      ),
      UserCarSurveyEntity(
        id: 'id2',
        refNo: 'refNo2',
        description: 'description 2 2 2  2 ola',
        assignTime: '20191005121413',
        car: 'car2',
      ),
      UserCarSurveyEntity(
        id: 'id3',
        refNo: 'refNo3',
        description: 'description 33333 ola',
        assignTime: '20181005101413',
        car: 'car',
      ),
      UserCarSurveyEntity(
        id: 'id4',
        refNo: 'refNo4',
        description: 'description 4 ola',
        assignTime: '20170105121413',
        car: 'car',
      ),
      UserCarSurveyEntity(
        id: 'id5',
        refNo: 'refNo5',
        description: 'description 5la',
        assignTime: '20161005121413',
        car: 'car',
      )
    ];
}