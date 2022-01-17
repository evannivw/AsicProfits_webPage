import 'package:asic_miner_website/Backend/Firebase/Firestore/FirestoreDatabase.dart';
import 'package:asic_miner_website/Models/DealModel.dart';
import 'package:asic_miner_website/Models/MinerModel.dart';
import 'package:json_annotation/json_annotation.dart';

class AdminMainPageController {
  List<MinerModel> minersList = [];
  DealModel deal = DealModel();
  Future loadAll({bool loadDeal = true}) async {
    //load all miners
    var respuesta = await FirestoreDatabase<MinerModel>()
        .get(FirestoreTable.miners, orderBy: "model");
    if (respuesta.error != null || respuesta.listValue == null) {
      print(respuesta.error.toString());
      return;
    }
    minersList =
        respuesta.listValue!.map((e) => MinerModel.fromJson(e)).toList();

    if (!loadDeal) return;
    //load deal
    var dealRespuesta = await FirestoreDatabase<DealModel>()
        .getDocument(FirestoreTable.deal, "deal1");
    if (dealRespuesta.error != null || dealRespuesta.value == null) {
      print("error llamada deal: " + dealRespuesta.error.toString());
      return;
    }
    deal = DealModel.fromJson(dealRespuesta.value);
    print("deal spots: " + deal.spots);
  }
}
