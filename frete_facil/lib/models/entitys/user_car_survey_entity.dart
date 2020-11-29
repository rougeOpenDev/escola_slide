class UserCarSurveyEntity
{
   final String id;
   final String refNo;
   final String description;
   final String assignTime;

   final String car;
  
   UserCarSurveyEntity({this.id, this.refNo, this.description, this.assignTime, this.car});
   
  factory UserCarSurveyEntity.fromJson(Map<String, dynamic> json) {
    return new  UserCarSurveyEntity(
      id: json['id'],
      refNo: json['refNo'],
      description: json['description'],
      assignTime: json['assignTime'],
      car: json['car'],
    );
  }
}