import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:team33_app/model/list.dart';
import 'package:team33_app/service/storage_service.dart';

class ListService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  StorageService _storageService = StorageService();
  String mediaUrl = "";

  Future<ListModel> addNot(String not, XFile pickedFile) async {
    var ref = _firestore.collection("Not");
    mediaUrl = await _storageService.uploadMedia(File(pickedFile.path));
    var documentRef = await ref.add({
      'not': not,
      'image': mediaUrl,
    });

    return ListModel(id: documentRef.id, not: not, image: mediaUrl);
  }

  //veri gösterme(anlık akış yani Stream kullanıyoruz)

  Stream<QuerySnapshot> getStatus() {
    var ref = _firestore.collection("Not").snapshots();
    return ref;
  }

  //veri silme
  Future<void> removeStatus(String docId) {
    var ref = _firestore.collection("Not").doc(docId).delete();

    return ref;
  }
}
