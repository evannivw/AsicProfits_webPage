import 'package:asic_miner_website/Backend/Firebase/Firestore/FirestoreDatabase.dart';
import 'package:asic_miner_website/Models/HostingFacilitiesModel.dart';

class HostingPageController {
  List<HostingFacilitiesModel> hostingList = [];

  Future loadHostingFacilities() async {
    var respuesta = await FirestoreDatabase<HostingFacilitiesModel>()
        .get(FirestoreTable.hostings);
    if (respuesta.error != null || respuesta.listValue == null) {
      print(respuesta.error.toString());
      return;
    }
    hostingList = respuesta.listValue!
        .map((e) => HostingFacilitiesModel.fromJson(e))
        .toList();
  }
}
