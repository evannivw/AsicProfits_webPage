import 'package:asic_miner_website/Helpers/UIHelper.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

/// This allows the `MinerModel` class to access private members in
/// the generated file. The value for this is *.g.dart, where
/// the star denotes the source file name.
part 'WhereToBuyModel.g.dart';

@JsonSerializable(explicitToJson: true)
class WhereToBuyModel {
  String imageURL = "";
  String nameSeller = "";
  String subtitle = "";
  String countryImageURL = "";
  String price = "";
  String available = "";
  String moreInfo = "";
  String shipping = "";
  String visitLink = "";

  factory WhereToBuyModel.fromJson(Map<String, dynamic> json) =>
      _$WhereToBuyModelFromJson(json);

  Map<String, dynamic> toJson() => _$WhereToBuyModelToJson(this);

  WhereToBuyModel({
    this.nameSeller = "",
    this.subtitle = "",
    this.countryImageURL = "",
    this.price = "",
    this.available = "",
    this.moreInfo = "",
    this.shipping = "",
    this.visitLink = "",
  });
}
