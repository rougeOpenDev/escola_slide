class UserCarEntity
{
   final String id;
   final String gears;

   final String name;

   final String brand;
   final String model;

   final String licencePlate;
   final String year;

   UserCarEntity({this.id, this.gears, this.name, this.brand, this.model, this.licencePlate, this.year});
   
   factory UserCarEntity.fromJson(Map<String, dynamic> json) {
    return new  UserCarEntity(
      id: json['id'],
      gears: json['gears'],
      name: json['name'],
      brand: json['brand'],
      model: json['model'],
      licencePlate: json['licencePlate'],
      year: json['year'],
    );
  }
}