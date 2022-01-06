import 'package:asic_miner_website/Models/MinerModel.dart';

class AsicProfitsMainController
{
  List<MinerModel> minersList = [];

  Future loadMinersList() async 
  {
    await Future.delayed(Duration(seconds: 1));
    minersList = List.generate(20, (index){
      return MinerModel();
    });
  }
}