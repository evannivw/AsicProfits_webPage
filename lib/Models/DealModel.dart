import 'dart:ui';

import 'package:asic_miner_website/Helpers/UIHelper.dart';
import 'package:asic_miner_website/Models/MinerModel.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

/// This allows the `MinerModel` class to access private members in
/// the generated file. The value for this is *.g.dart, where
/// the star denotes the source file name.
part 'DealModel.g.dart';

@JsonSerializable(explicitToJson: true)
class DealModel {
  String id = "";
  String price = "";
  String spots = "";
  MinerModel? miner;

  factory DealModel.fromJson(Map<String, dynamic> json) =>
      _$DealModelFromJson(json);

  Map<String, dynamic> toJson() => _$DealModelToJson(this);

  ///Init secction
  DealModel({
    this.id = "",
    this.price = "",
    this.spots = "",
    this.miner,
  });
}
