import 'package:flutter/services.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:petApp/models/pets.model.dart';

class PetsRepository {
  FirebaseFirestore firestore;
  PetsRepository() {
    this.firestore = FirebaseFirestore.instance;
  }

  Future<List<PetsModel>> getPets() async {
    try {
      List<PetsModel> data = List();
      await this.firestore.collection('pets').get()
        ..docs.forEach((element) {
          data.add(PetsModel(
            id: element.id,
            name: element["name"],
            imagePath: element["imagePath"],
            breed: element["breed"],
            gender: element["gender"],
            age: element["age"],
            distance: element["distance"],
          ));
        });
      return data;
    } on PlatformException catch (e) {
      throw Exception(e.toString());
    }
  }
}
