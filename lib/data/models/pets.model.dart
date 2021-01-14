import 'package:equatable/equatable.dart';

class PetsModel extends Equatable {
  String id;
  String name;
  String imagePath;
  String breed;
  String gender;
  String age;
  String distance;

  PetsModel(
      {this.id,
      this.name,
      this.imagePath,
      this.breed,
      this.gender,
      this.age,
      this.distance});

  @override
  List<Object> get props => [id, name, imagePath, breed, gender, age, distance];

  PetsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    imagePath = json['imagePath'];
    breed = json['breed'];
    gender = json['gender'];
    age = json['age'];
    distance = json['distance'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['imagePath'] = this.imagePath;
    data['breed'] = this.breed;
    data['gender'] = this.gender;
    data['age'] = this.age;
    data['distance'] = this.distance;
    return data;
  }

  PetsModel copyWith({
    String id,
    String name,
    String imagePath,
    String breed,
    String gender,
    String age,
    String distance,
  }) {
    return PetsModel(
        id: id ?? this.id,
        name: name ?? this.name,
        imagePath: imagePath ?? this.imagePath,
        breed: breed ?? this.breed,
        gender: gender ?? this.gender,
        age: age ?? this.age,
        distance: distance ?? this.distance);
  }
}
