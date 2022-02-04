import 'package:asic_miner_website/Backend/Firebase/Firestore/FirestoreDatabase.dart';
import 'package:asic_miner_website/Models/DealModel.dart';
import 'package:asic_miner_website/Models/MinerModel.dart';

class AsicProfitsMainController {
  List<MinerModel> minersList = [];
  DealModel deal = DealModel();
  int idC1 = 0;
  int idC2 = 0;
  int cantC1 = 0;
  int cantC2 = 0;
  //Loads miners list and stored in minersList
  Future loadAll({bool loadDeals = true}) async {
    var respuesta =
        await FirestoreDatabase<MinerModel>().get(FirestoreTable.miners);
    if (respuesta.error != null || respuesta.listValue == null) {
      print("error llamada list-miners" + respuesta.error.toString());
      return;
    }
    minersList =
        respuesta.listValue!.map((e) => MinerModel.fromJson(e)).toList();
    /*await Future.delayed(Duration(seconds: 1));
    minersList = List.generate(20, (index) {
      return MinerModel();
    });*/

    //load deal
    if (!loadDeals) return;
    var dealRespuesta = await FirestoreDatabase<DealModel>()
        .getDocument(FirestoreTable.deal, "deal1");
    if (dealRespuesta.error != null || dealRespuesta.value == null) {
      print("error llamada deal: " + dealRespuesta.error.toString());
      return;
    }
    deal = DealModel.fromJson(dealRespuesta.value);
  }
}
