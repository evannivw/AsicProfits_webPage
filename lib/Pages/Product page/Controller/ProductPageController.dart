import 'package:asic_miner_website/Backend/Firebase/Firestore/FirestoreDatabase.dart';
import 'package:asic_miner_website/Models/HostingFacilitiesModel.dart';

class ProductPageController {
  List<HostingFacilitiesModel> hostingFacilitiesList = [];

  ///Loads hosting facilites and stored in hostingFacilitiesList
  Future loadHostingFacilities() async {
    var respuesta = await FirestoreDatabase<HostingFacilitiesModel>()
        .get(FirestoreTable.hostings);
    if (respuesta.error != null || respuesta.listValue == null) {
      print(respuesta.error.toString());
      return;
    }
    hostingFacilitiesList = respuesta.listValue!
        .map((e) => HostingFacilitiesModel.fromJson(e))
        .toList();
    if (hostingFacilitiesList.length > 6) {
      hostingFacilitiesList.removeRange(6, hostingFacilitiesList.length);
    }
  }
}
