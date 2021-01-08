import 'package:cloud_firestore/cloud_firestore.dart';

class Repository {
  FirebaseFirestore firestore;
  Repository() {
    this.firestore = FirebaseFirestore.instance;
  }
}
