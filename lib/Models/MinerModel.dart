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
class MinerModel {
  String id;
  String model;
  String color;
  String release;
  String hashrate;
  String hashrateUnits;
  String power;
  String noise;
  String algo;
  String visitLink;
  String manu;
  String desc;
  String fans;
  String voltage;
  String interface;
  String temperature;
  String humidity;
  String weight;
  String size;
  String efficiency;
  String imageURL;
  String status;
  List<MinableCoinModel> minableCoinList = [];
  List<WhereToBuyModel> whereToBuyList = [];
  List<MiningPoolModel> miningPoolList = [];
  DateTime? date;

  factory MinerModel.fromJson(Map<String, dynamic> json) =>
      _$MinerModelFromJson(json);

  Map<String, dynamic> toJson() => _$MinerModelToJson(this);

  ///Init secction
  MinerModel({
    this.id = "",
    this.model = "N/A",
    this.color = "yellow",
    this.release = "Coming soon",
    this.hashrate = "0",
    this.hashrateUnits = "H/s",
    this.power = "0",
    this.noise = "0",
    this.algo = "EtHash",
    this.visitLink = "",
    this.manu = "0",
    this.desc = "0",
    this.voltage = "0",
    this.fans = "0",
    this.interface = "Ethernet",
    this.temperature = "0",
    this.humidity = "0",
    this.weight = "0",
    this.size = "0",
    this.efficiency = "0",
    this.minableCoinList = const [],
    this.whereToBuyList = const [],
    this.miningPoolList = const [],
    this.date,
    this.imageURL = "",
    this.status = "",
  });

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
