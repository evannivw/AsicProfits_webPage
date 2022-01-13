import 'package:asic_miner_website/Backend/Firebase/Firestore/FirestoreDatabase.dart';
import 'package:asic_miner_website/Models/MinerModel.dart';
import 'package:json_annotation/json_annotation.dart';

class AdminMainPageController {
  List<MinerModel> minersList = [];

  Future loadMinersList() async {
    var respuesta = await FirestoreDatabase<MinerModel>()
        .get(FirestoreTable.miners, orderBy: "model");
    if (respuesta.error != null || respuesta.listValue == null) {
      print(respuesta.error.toString());
      return;
    }
    //print("cantidad descargada: ${respuesta.listValue}");
    minersList =
        respuesta.listValue!.map((e) => MinerModel.fromJson(e)).toList();
  }
}
