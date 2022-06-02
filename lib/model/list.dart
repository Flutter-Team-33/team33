import 'package:cloud_firestore/cloud_firestore.dart';

class ListModel {
  String id;
  String not;
  String image;

  ListModel({required this.id, required this.not, required this.image});

  factory ListModel.fromSnapshot(DocumentSnapshot snapshot) {
    return ListModel(
      id: snapshot.id,
      not: snapshot['not'],
      image: snapshot['image'],
    );
  }
}
