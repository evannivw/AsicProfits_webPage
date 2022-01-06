import 'package:asic_miner_website/Models/HostingFacilitiesModel.dart';

class ProductPageController
{
  List<HostingFacilitiesModel> hostingFacilitiesList = [];

  Future loadHostingFacilities() async
  {
    await Future.delayed(Duration(seconds: 1));
    hostingFacilitiesList = List.generate(5, (id)
    {
      return HostingFacilitiesModel(namePlace: id.toString());
    });
  }
}