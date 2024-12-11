import 'package:cloud_firestore/cloud_firestore.dart';

class ApiCollections {
  static final _instance = FirebaseFirestore.instance;

  ApiCollections._();

  static final users = _instance.collection('users');
  static final categories = _instance.collection('categories');
  static final descriptions = _instance.collection('descriptions');
  static final transactions = _instance.collection('transactions');
}
