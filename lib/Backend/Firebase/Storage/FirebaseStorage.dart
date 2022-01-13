import 'dart:typed_data';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class FirebaseStorage {
  Future uploadImage(Uint8List bytes, String id, String path) async {
    firebase_storage.UploadTask uploadTask;

    firebase_storage.Reference ref = firebase_storage.FirebaseStorage.instance
        .ref()
        .child(id)
        .child('/$path.png');

    uploadTask = ref.putData(bytes);

    await Future.value(uploadTask);

    return await _downloadLink(ref);
  }

  Future<String> _downloadLink(firebase_storage.Reference ref) async {
    final link = await ref.getDownloadURL();
    return link;
  }
}
