import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:petApp/data/models/pets.model.dart';
import 'package:petApp/data/repositories/repository.dart';

class PetsRepository extends Repository {
  PetsRepository() : super();

  Stream<List<PetsModel>> getPets() {
    try {
      Query query = this.firestore.collection('pets');
      return query.snapshots().map((snapshot) {
        return snapshot.docs.map((doc) {
          //            String url =  firebase_storage.FirebaseStorage.instance
          // .ref('images/pets/${doc["imagePath"]}')
          // .getDownloadURL();
          String url = 'assets/images/${doc["imagePath"]}';
          return PetsModel(
            id: doc.id,
            name: doc["name"],
            imagePath: url,
            breed: doc["breed"],
            gender: doc["gender"],
            age: doc["age"],
            distance: doc["distance"],
          );
        }).toList();
      });
    } on PlatformException catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<List<PetsModel>> getPetsForCategories(categorieId) async {
    try {
      List<PetsModel> data = List();
      await this
          .firestore
          .collection('pets')
          .where('category_id', isEqualTo: categorieId)
          .get()
        ..docs.forEach((doc) {
          print(doc);
          String url = 'assets/images/${doc["imagePath"]}';
          data.add(PetsModel(
            id: doc.id,
            name: doc["name"],
            imagePath: url,
            breed: doc["breed"],
            gender: doc["gender"],
            age: doc["age"],
            distance: doc["distance"],
          ));
        });
      return data;
    } on PlatformException catch (e) {
      throw Exception(e.toString());
    }
  }
}
