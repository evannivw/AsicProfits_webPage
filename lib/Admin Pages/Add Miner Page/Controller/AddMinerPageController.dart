import 'package:asic_miner_website/Models/MinerModel.dart';
import 'package:flutter/material.dart';

class AddMinerPageController
{
  List<bool> _currentMiningPool = [];
  List<bool> _currentWhereToBuy = [];
  List<bool> _currentMinableCoin = [];

  List<bool> get currentMiningPools => _currentMiningPool;
  List<bool> get currentWhereToBuy => _currentWhereToBuy;
  List<bool> get currentMinableCoin => _currentMinableCoin;

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

  void fillTextsControllers(MinerModel miner)
  {
    modelTEC = TextEditingController(text: miner.model);
    manuTEC = TextEditingController(text: "");
    descTEC = TextEditingController(text: "");
    releaseTEC = TextEditingController(text: miner.release);
    noiseTEC = TextEditingController(text: miner.noise);
    fansTEC = TextEditingController(text: "");
    voltageTEC = TextEditingController(text: "");
    interfaceTEC = TextEditingController(text: "");
    temperatureTEC = TextEditingController(text: "");
    humidityTEC = TextEditingController(text: "");
    weightTEC = TextEditingController(text: "");
    sizeTEC = TextEditingController(text: "");
    algoTEC = TextEditingController(text: miner.algo);
    efficiencyTEC = TextEditingController(text: "");
    hashrateTEC = TextEditingController(text: miner.hashrate);
    powerTEC = TextEditingController(text: miner.power);
    costperkwTEC = TextEditingController(text: "");
    poolFeeTEC = TextEditingController(text: "");
    visitLinkTEC = TextEditingController(text: miner.visitLink);
  }

  void addNewMiningPool()
  {
    _currentMiningPool.add(true);
  }

  void removeMiningPool()
  {
    _currentMiningPool.removeLast();
  }

  void addNewWhereToBuy()
  {
    _currentWhereToBuy.add(true);
  }

  void removeWhereToBuy()
  {
    _currentWhereToBuy.removeLast();
  }

  void addNewMinableCoin()
  {
    _currentMinableCoin.add(true);
  }

  void removeMinableCoin()
  {
    _currentMinableCoin.removeLast();
  }
}