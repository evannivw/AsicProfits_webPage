import 'package:asic_miner_website/Backend/Firebase/Firestore/FirestoreDatabase.dart';
import 'package:asic_miner_website/Backend/MinerStats/MinerStatsApi.dart';
import 'package:asic_miner_website/Helpers/MinerServiceHelper.dart';
import 'package:asic_miner_website/Models/DealModel.dart';
import 'package:asic_miner_website/Models/MinerModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
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
    //print(respuesta.listValue);
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

  Future addNewChatData() async {
    for (var i = 0; i < minersList.length; i++) {
      var miner = minersList[i];
      var data =
          await MinerStatsApi().getProfitability(params: "algo=${miner.algo}");
      var calculo = MinerServiceHelper()
          .calculateProfitabilityFromArray(minersList[0], data);
      print(" Profit(1): \$" + calculo[0].toString());
      print(" Power cost(2): \$" + calculo[1].toString());
      await FirebaseFirestore.instance.collection("chart_data").add({
        "id": miner.id,
        "date": DateTime.now(),
        "profitability": calculo[0],
        "income": (calculo[0] + calculo[1]),
        "cost": calculo[1],
      });
    }
  }
}
