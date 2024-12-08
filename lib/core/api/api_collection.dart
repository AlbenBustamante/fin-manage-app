import 'package:cloud_firestore/cloud_firestore.dart';

class ApiCollection {
  static final _instance = FirebaseFirestore.instance;

  ApiCollection._();

  static final users = _instance.collection('users');
}
