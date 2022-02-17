import 'package:asic_miner_website/Models/MinerModel.dart';
import 'package:flutter/material.dart';

class ProfitabilityWidgetController extends ChangeNotifier {
  List<MinerModel> currentList = [];
  void updateProfitability(List<MinerModel> list) {
    //print("should update profitability");
    currentList = list;
    notifyListeners();
  }
}
