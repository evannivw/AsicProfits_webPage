import 'package:asic_miner_website/Backend/Firebase/Firestore/FirestoreDatabase.dart';
import 'package:asic_miner_website/Models/PartnersModel.dart';

class VendorsPageController {
  List<PartnersModel> partnersList = [];

  Future loadPartners() async {
    var respuesta = await FirestoreDatabase<PartnersModel>()
        .get(FirestoreTable.partners, orderBy: "name");
    if (respuesta.error != null || respuesta.listValue == null) {
      print(respuesta.error.toString());
      return;
    }
    partnersList =
        respuesta.listValue!.map((e) => PartnersModel.fromJson(e)).toList();
    print("PARTNERS: " + partnersList.length.toString());
  }
}
