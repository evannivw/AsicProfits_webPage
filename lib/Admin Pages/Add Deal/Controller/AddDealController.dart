import 'package:asic_miner_website/Backend/Firebase/Firestore/FirestoreDatabase.dart';
import 'package:asic_miner_website/Models/DealModel.dart';
import 'package:asic_miner_website/Models/MinerModel.dart';
import 'package:flutter/material.dart';

class AddDealController {
  TextEditingController priceTEC = TextEditingController();
  TextEditingController spotsTEC = TextEditingController();
  MinerModel dealMiner = MinerModel();
  void fillTEC(DealModel _deal) {
    priceTEC = TextEditingController(text: _deal.price);
    spotsTEC = TextEditingController(text: _deal.price);
    dealMiner = _deal.miner ?? MinerModel();
  }

  void save(Function callback) async {
    var _deal = loadFromDeal();
    var result = await FirestoreDatabase<DealModel>()
        .set(_deal, FirestoreTable.deal, "deal1");
    if (result.error != null) {
      print(result.error);
    } else {
      print("new deal added");
      callback();
    }
  }

  DealModel loadFromDeal() {
    var _deal = DealModel();

    _deal.miner = dealMiner;
    _deal.price = priceTEC.text;
    _deal.spots = spotsTEC.text;
    return _deal;
  }
}
