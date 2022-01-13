import 'package:asic_miner_website/Helpers/UIHelper.dart';
import 'package:asic_miner_website/Models/MinableCoinModel.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

/// This allows the `MinerModel` class to access private members in
/// the generated file. The value for this is *.g.dart, where
/// the star denotes the source file name.
part 'MiningPoolModel.g.dart';

@JsonSerializable(explicitToJson: true)
class MiningPoolModel {
  String imageURL = "";
  String name = "";
  String webPage = "";
  List<MinableCoinModel> miningPlans = [];
  String referalCode = "";
  String fees = "";
  String visitLink = "";

  factory MiningPoolModel.fromJson(Map<String, dynamic> json) =>
      _$MiningPoolModelFromJson(json);

  Map<String, dynamic> toJson() => _$MiningPoolModelToJson(this);

  MiningPoolModel({
    this.imageURL = "",
    this.name = "",
    this.webPage = "",
    this.miningPlans = const [],
    this.referalCode = "",
    this.fees = "",
    this.visitLink = "",
  });
}
