import 'package:flutter/services.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:petApp/models/pets.model.dart';
import 'package:petApp/repositories/repository.dart';

class PetsRepository extends Repository {
  PetsRepository() : super();

  Future<List<PetsModel>> getPets() async {
    try {
      List<PetsModel> data = List();

      await this.firestore.collection('pets').get()
        ..docs.forEach((element) async {
          String url = await firebase_storage.FirebaseStorage.instance
              .ref('images/pets/${element["imagePath"]}')
              .getDownloadURL();
          data.add(PetsModel(
            id: element.id,
            name: element["name"],
            imagePath: url,
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
