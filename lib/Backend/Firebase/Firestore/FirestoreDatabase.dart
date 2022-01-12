import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

enum FirestoreTable {
  users,
  miners,
  hostings,
}

class FirestoreResult<T> {
  dynamic error;
  T? value;
  List<T>? listValue;
  FirestoreResult({this.error, this.value, this.listValue});
}

class FirestoreDatabase<T> {
  String _getFunction(FirestoreTable table) {
    switch (table) {
      case FirestoreTable.users:
        return "users";
      case FirestoreTable.miners:
        return "miners";
      case FirestoreTable.hostings:
        return "hostings";
    }
  }

  bool _checkId(String id) {
    if (id.isEmpty) return false;
    return true;
  }

  Future<FirestoreResult<T>> getDocument(
      FirestoreTable table, String id) async {
    if (!_checkId(id)) {
      return FirestoreResult(error: "Id incorrecto");
    }

    CollectionReference collection =
        FirebaseFirestore.instance.collection(_getFunction(table));

    var ref = collection.doc(id);

    var document = await _callGet(documentReference: ref);
    if (document == null) {
      return FirestoreResult(error: "Error en get");
    }

    if (document.exists == false) {
      return FirestoreResult(error: "Documento no existe");
    }

    var data = _convertValue(document.data());
    if (data == null) {
      return FirestoreResult(error: "Error al convertir valor");
    }
    return FirestoreResult(value: data);
  }

  Future<FirestoreResult<T>> get(FirestoreTable table,
      {int limit = 30, String orderBy = "date"}) async {
    var query = FirebaseFirestore.instance
        .collection(_getFunction(table))
        .orderBy(orderBy)
        .limitToLast(limit);

    var document = await _callGet(query: query) as QuerySnapshot;
    if (document == null) {
      return FirestoreResult(error: "Error en get");
    }

    List<T> returnList = [];

    for (var doc in document.docs) {
      if (doc.exists) {
        var data = _convertValue(doc.data());
        if (data != null) {
          returnList.add(data);
        }
      }
    }

    return FirestoreResult(listValue: returnList);
  }

  Future<dynamic> _callGet({
    DocumentReference? documentReference,
    CollectionReference? collectionReference,
    Query? query,
  }) async {
    try {
      if (documentReference != null) {
        return await documentReference.get();
      } else if (collectionReference != null) {
        return await collectionReference.get();
      } else if (query != null) {
        return await query.get();
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  T? _convertValue(Object? data) {
    try {
      var value = jsonDecode(data.toString());
      return value;
    } catch (e) {
      return null;
    }
  }
}
