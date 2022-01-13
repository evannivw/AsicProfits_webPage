import 'package:asic_miner_website/Admin%20Pages/Add%20Miner%20Page/Views/AddMinerMiningPools.dart';
import 'package:asic_miner_website/Backend/Firebase/Firestore/FirestoreDatabase.dart';
import 'package:asic_miner_website/Models/MinableCoinModel.dart';
import 'package:asic_miner_website/Models/MinerModel.dart';
import 'package:asic_miner_website/Models/MiningPoolModel.dart';
import 'package:asic_miner_website/Models/WhereToBuyModel.dart';
import 'package:flutter/material.dart';

class AddMinerPageController {
  List<MiningPoolModel> _currentMiningPool = [];
  List<WhereToBuyModel> _currentWhereToBuy = [];
  List<MinableCoinModel> _currentMinableCoin = [];

  List<MiningPoolModel> get currentMiningPools => _currentMiningPool;
  List<WhereToBuyModel> get currentWhereToBuy => _currentWhereToBuy;
  List<MinableCoinModel> get currentMinableCoin => _currentMinableCoin;

  TextEditingController modelTEC = TextEditingController();
  TextEditingController manuTEC = TextEditingController();
  TextEditingController descTEC = TextEditingController();
  TextEditingController releaseTEC = TextEditingController();
  TextEditingController noiseTEC = TextEditingController();
  TextEditingController fansTEC = TextEditingController();
  TextEditingController voltageTEC = TextEditingController();
  TextEditingController interfaceTEC = TextEditingController();
  TextEditingController temperatureTEC = TextEditingController();
  TextEditingController humidityTEC = TextEditingController();
  TextEditingController weightTEC = TextEditingController();
  TextEditingController sizeTEC = TextEditingController();
  TextEditingController algoTEC = TextEditingController();
  TextEditingController efficiencyTEC = TextEditingController();
  TextEditingController hashrateTEC = TextEditingController();
  TextEditingController powerTEC = TextEditingController();
  TextEditingController costperkwTEC = TextEditingController();
  TextEditingController poolFeeTEC = TextEditingController();
  TextEditingController visitLinkTEC = TextEditingController();
  String hashrateUnits = "H/s";
  String imageURL = "";
  String id = "";
  String color = "";

  void fillTextsControllers(MinerModel miner) {
    modelTEC = TextEditingController(text: miner.model);
    manuTEC = TextEditingController(text: miner.manu);
    descTEC = TextEditingController(text: miner.desc);
    releaseTEC = TextEditingController(text: miner.release);
    noiseTEC = TextEditingController(text: miner.noise);
    fansTEC = TextEditingController(text: miner.fans);
    voltageTEC = TextEditingController(text: miner.voltage);
    interfaceTEC = TextEditingController(text: miner.interface);
    temperatureTEC = TextEditingController(text: miner.temperature);
    humidityTEC = TextEditingController(text: miner.humidity);
    weightTEC = TextEditingController(text: miner.weight);
    sizeTEC = TextEditingController(text: miner.size);
    algoTEC = TextEditingController(text: miner.algo);
    efficiencyTEC = TextEditingController(text: miner.efficiency);
    hashrateTEC = TextEditingController(text: miner.hashrate);
    powerTEC = TextEditingController(text: miner.power);
    costperkwTEC = TextEditingController(text: "");
    poolFeeTEC = TextEditingController(text: "");
    visitLinkTEC = TextEditingController(text: miner.visitLink);
    color = miner.color.isEmpty ? "Yellow" : miner.color;
    if (miner.id.isEmpty) {
      id = FirestoreDatabase().getKey(FirestoreTable.miners);
    } else {
      id = miner.id;
    }
    for (var value in miner.minableCoinList) _currentMinableCoin.add(value);

    for (var value in miner.miningPoolList) _currentMiningPool.add(value);

    for (var value in miner.whereToBuyList) _currentWhereToBuy.add(value);
  }

  void addNewMiningPool() {
    _currentMiningPool.add(MiningPoolModel());
  }

  void removeMiningPool(int id) {
    _currentMiningPool.removeAt(id);
  }

  void addNewWhereToBuy() {
    _currentWhereToBuy.add(WhereToBuyModel());
  }

  void removeWhereToBuy(int id) {
    _currentWhereToBuy.removeAt(id);
  }

  void addNewMinableCoin() {
    _currentMinableCoin.add(MinableCoinModel());
  }

  void removeMinableCoin(int id) {
    _currentMinableCoin.removeAt(id);
  }

  void save(MinerModel currentMiner, Function callback) async {
    var _miner = _fillMinerModel(currentMiner);
    var result = await FirestoreDatabase<MinerModel>()
        .set(_miner, FirestoreTable.miners, _miner.id);
    if (result.error != null) {
      print(result.error);
    } else {
      print("new miner added");
      callback();
    }
  }

  MinerModel _fillMinerModel(MinerModel currentMiner) {
    var _miner = currentMiner;
    if (_miner.id.isEmpty) {
      if (id.isEmpty) {
        _miner.id = FirestoreDatabase().getKey(FirestoreTable.miners);
      } else {
        _miner.id = id;
      }
    }
    _miner.date = DateTime.now();
    _miner.model = modelTEC.text;
    _miner.manu = manuTEC.text;
    _miner.desc = descTEC.text;
    _miner.release = releaseTEC.text;
    _miner.noise = noiseTEC.text;
    _miner.fans = fansTEC.text;
    _miner.voltage = voltageTEC.text;
    _miner.interface = interfaceTEC.text;
    _miner.temperature = temperatureTEC.text;
    _miner.humidity = humidityTEC.text;
    _miner.weight = weightTEC.text;
    _miner.size = sizeTEC.text;
    _miner.algo = algoTEC.text;
    _miner.efficiency = efficiencyTEC.text;
    _miner.power = powerTEC.text;
    _miner.hashrate = hashrateTEC.text;
    _miner.hashrateUnits = hashrateUnits;
    _miner.minableCoinList = currentMinableCoin;
    _miner.miningPoolList = currentMiningPools;
    _miner.whereToBuyList = currentWhereToBuy;
    _miner.visitLink = visitLinkTEC.text;
    _miner.imageURL = imageURL;
    _miner.color = color;
    return _miner;
  }
}
