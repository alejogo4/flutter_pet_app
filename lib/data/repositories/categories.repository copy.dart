import 'package:flutter/services.dart';
import 'package:petApp/data/models/categories.model.dart';

import 'package:petApp/data/repositories/repository.dart';

class CategoriesRepository extends Repository {
  CategoriesRepository() : super();

  Future<List<CategoriesModel>> getCategories() async {
    try {
      List<CategoriesModel> data = List();
      await this.firestore.collection('categories').get()
        ..docs.forEach((element) {
          data.add(CategoriesModel(
            id: element.id,
            iconPath: element["iconPath"],
            name: element["name"],
          ));
        });
      return data;
    } on PlatformException catch (e) {
      throw Exception(e.toString());
    }
  }
}
