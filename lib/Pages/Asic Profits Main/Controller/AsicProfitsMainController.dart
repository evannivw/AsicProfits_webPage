import 'package:asic_miner_website/Backend/Firebase/Firestore/FirestoreDatabase.dart';
import 'package:asic_miner_website/Models/MinerModel.dart';

class AsicProfitsMainController {
  List<MinerModel> minersList = [];
  int idC1 = 0;
  int idC2 = 0;
  int cantC1 = 0;
  int cantC2 = 0;
  //Loads miners list and stored in minersList
  Future loadMinersList() async {
    var respuesta =
        await FirestoreDatabase<MinerModel>().get(FirestoreTable.miners);
    if (respuesta.error != null || respuesta.listValue == null) {
      print(respuesta.error.toString());
      return;
    }
    minersList =
        respuesta.listValue!.map((e) => MinerModel.fromJson(e)).toList();
    /*await Future.delayed(Duration(seconds: 1));
    minersList = List.generate(20, (index) {
      return MinerModel();
    });*/
  }
}
