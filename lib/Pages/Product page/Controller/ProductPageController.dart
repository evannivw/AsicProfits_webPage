import 'package:asic_miner_website/Backend/Firebase/Firestore/FirestoreDatabase.dart';
import 'package:asic_miner_website/Models/HostingFacilitiesModel.dart';
import 'package:asic_miner_website/Models/MinerModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

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

  Future loadChartData(MinerModel miner) async {
    var data = await FirebaseFirestore.instance
        .collection("chart_data")
        .where("id", isEqualTo: miner.id)
        .orderBy("date")
        .limit(100)
        .get();
    if (data.docs.isNotEmpty) {
      List<dynamic> lista = [];
      data.docs.forEach((element) {
        lista.add(element.data());
      });
      /*for (int j = 0; j < data.docs.length; j++) {
        var element = data.docs[j];
        if (lista.isEmpty) {
          lista.add(element.data());
        } else {
          var isAdded = false;
          for (int i = 0; i < lista.length; i++) {
            var elementDate = element.data()["date"] as Timestamp;
            var currentDate = lista[i]["date"] as Timestamp;
            print("currentDate: " + currentDate.toString());
            if (elementDate.nanoseconds < currentDate.nanoseconds && !isAdded) {
              lista.insert(i, element);
              isAdded = true;
              break;
            }
          }
          if (isAdded == false) {
            lista.add(element.data());
          }
        }
      }*/
      //print(lista);
      lista.sort(
        (a, b) {
          var elementDate = a["date"] as Timestamp;
          var currentDate = b["date"] as Timestamp;
          var compare = elementDate.compareTo(currentDate);
          //print("compare: " + compare.toString());
          return compare;
        },
      );
      //print(lista);
      return lista;
    }
    return [];
  }
}
