import 'dart:ui';

import 'package:asic_miner_website/Helpers/UIHelper.dart';
import 'package:asic_miner_website/Models/MinableCoinModel.dart';
import 'package:asic_miner_website/Models/MiningPoolModel.dart';
import 'package:asic_miner_website/Models/WhereToBuyModel.dart';
import 'package:asic_miner_website/Pages/Product%20page/Product%20Page%20Views/WhereToBuyCard.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

/// This allows the `MinerModel` class to access private members in
/// the generated file. The value for this is *.g.dart, where
/// the star denotes the source file name.
part 'MinerModel.g.dart';


@JsonSerializable(explicitToJson: true)
class MinerModel
{
  String _model = "";
  String _color = "yellow";
  String _release = "Coming soon";
  String _hashrate = "0";
  String _hashrateUnits = "H/s";
  String _power = "0";
  String _noise = "0";
  String _algo = "EtHash";
  String _visitLink = "";
  List<MinableCoinModel> minableCoinList = [];
  List<WhereToBuyModel> whereToBuyList = [];
  List<MiningPoolModel> miningPoolList = [];

  ///Get secction
  String get model => _model;
  String get color => _color;
  String get release => _release;
  String get hashrate => _hashrate;
  String get hashrateUnits => _hashrateUnits;
  String get power => _power;
  String get noise => _noise;
  String get algo => _algo;
  String get visitLink => _visitLink;


  ///Set secction
  set model(String value)
  {
    _model = value;
  }
  set color(String value)
  {
    _color = value;
  }
  set release(String value)
  {
    _release = value;
  }
  set hashrate(String value,)
  {
    _hashrate = value;
  }
  set hashrateUnits(String value,)
  {
    _hashrateUnits = value;
  }
  set power(String value)
  {
    _power = value;
  }
  set noise(String value)
  {
    _noise = value;
  }
  set algo(String value)
  {
    _algo = value;
  }
  set visitLink(String value)
  {
    _visitLink = value;
  }


  factory MinerModel.fromJson(Map<String, dynamic> json) => _$MinerModelFromJson(json);

  Map<String, dynamic> toJson() => _$MinerModelToJson(this);


  ///Init secction
  MinerModel(
    {
      String model = "",
      String color = "yellow",
      String release = "Coming soon",
      String hashrate = "0",
      String hasrateUnits = "H/s",
      String power = "0",
      String noise = "0",
      String algo = "EtHash",
      String visitLink = "",
      List<MinableCoinModel> minableCoinList = const [],
      List<WhereToBuyModel> whereToBuyList = const [],
      List<MiningPoolModel> miningPoolList = const [],
    }
  ){
    _model = model;
    _color = color;
    _release = release;
    _hashrate = hashrate;
    _hashrateUnits = hasrateUnits;
    _power = power;
    _noise = noise;
    _algo = algo;
    _visitLink = visitLink;
    this.minableCoinList = minableCoinList;
    this.whereToBuyList = whereToBuyList;
    this.miningPoolList = miningPoolList;
  }

  /*//Convert class in to json 
  Map<String, dynamic> toJson() => {
    'model': _model,
    'color': _color,
    'release': _release,
    'hashrate': _hashrate,
    'hashrateUnits': _hashrateUnits,
    'power': _power,
    'noise': _noise,
    'algo': _algo,
    'visitLink': _visitLink,
  };

  //convert from json in to class
  MinerModel.fromJson(Map<String,dynamic>json)
  {
    model = json['model'] ?? "";
    color = UIHelper().fromStringToColor(json['color'] ?? "");
    release = json['release'] ?? "";
    hashrate = json['hashrate'] ?? "";
    hashrateUnits = json['hashrateUnits'] ?? "";
    power = json['power'] ?? "";
    noise = json['noise'] ?? "";
    algo = json['algo'] ?? "";
    visitLink = json['visitLink'] ?? "";
  }*/



}