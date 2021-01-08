import 'package:equatable/equatable.dart';

class CategoriesModel extends Equatable {
  String id;
  String iconPath;
  String name;

  CategoriesModel({this.iconPath, this.name, this.id});

  @override
  List<Object> get props => [iconPath, name];

  CategoriesModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    iconPath = json['iconPath'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['iconPath'] = this.iconPath;
    data['name'] = this.name;
    return data;
  }

  CategoriesModel copyWith({
    String id,
    String iconPath,
    String name,
  }) {
    return CategoriesModel(
      id: id ?? this.id,
      iconPath: iconPath ?? this.iconPath,
      name: name ?? this.name,
    );
  }
}
