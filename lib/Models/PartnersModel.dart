import 'package:asic_miner_website/Helpers/UIHelper.dart';
import 'package:asic_miner_website/Models/MinableCoinModel.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

/// This allows the `MinerModel` class to access private members in
/// the generated file. The value for this is *.g.dart, where
/// the star denotes the source file name.
part 'PartnersModel.g.dart';

@JsonSerializable(explicitToJson: true)
class PartnersModel {
  String id = "";
  String imageURL = "";
  String name = "";
  String webPage = "";
  String countryImageURL = "";
  String countryName = "";
  String distributor = "";
  String payment = "";
  String trust = "";
  String visitLink = "";

  factory PartnersModel.fromJson(Map<String, dynamic> json) =>
      _$PartnersModelFromJson(json);

  Map<String, dynamic> toJson() => _$PartnersModelToJson(this);

  PartnersModel({
    this.id = "",
    this.imageURL = "",
    this.name = "",
    this.webPage = "",
    this.countryImageURL = "",
    this.countryName = "",
    this.distributor = "",
    this.payment = "",
    this.trust = "",
    this.visitLink = "",
  });
}
