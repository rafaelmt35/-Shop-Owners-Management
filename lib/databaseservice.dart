import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  static CollectionReference productCatalogue =
      FirebaseFirestore.instance.collection('products');

  static Future<String> uploadImage(File imagefile) async {
    String filename = basename(imagefile.path);
    Reference ref = FirebaseStorage.instance.ref().child(filename);
    UploadTask task = ref.putFile(imagefile);
    TaskSnapshot snapshot = await task;
    return await snapshot.ref.getDownloadURL();
  }
}
