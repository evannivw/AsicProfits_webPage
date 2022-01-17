import 'package:asic_miner_website/Backend/Firebase/Firestore/FirestoreDatabase.dart';
import 'package:asic_miner_website/Models/MinerModel.dart';

class BuyingOpportunitiesController {
  List<MinerModel> minerList = [];
  //Loads miners list and stored in minersList
  Future loadAll() async {
    var respuesta =
        await FirestoreDatabase<MinerModel>().get(FirestoreTable.miners);
    if (respuesta.error != null || respuesta.listValue == null) {
      print("error llamada list-miners" + respuesta.error.toString());
      return;
    }
    minerList =
        respuesta.listValue!.map((e) => MinerModel.fromJson(e)).toList();
    /*await Future.delayed(Duration(seconds: 1));
    minersList = List.generate(20, (index) {
      return MinerModel();
    });*/
  }
}
