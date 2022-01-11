import 'package:asic_miner_website/Models/HostingFacilitiesModel.dart';

class HostingPageController {
  List<HostingFacilitiesModel> hostingList = [];

  Future loadHostingFacilities() async {
    await Future.delayed(Duration(seconds: 1));
    hostingList = List.generate(20, (index) {
      return HostingFacilitiesModel();
    });
  }
}
