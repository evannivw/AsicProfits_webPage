
import 'package:asic_miner_website/Helpers/UIHelper.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

/// This allows the `MinerModel` class to access private members in
/// the generated file. The value for this is *.g.dart, where
/// the star denotes the source file name.
part 'WhereToBuyModel.g.dart';

@JsonSerializable(explicitToJson: true)
class WhereToBuyModel
{
  String id = "";
  String imageURL = "";
  String nameSeller = "";
  String subtitle = "";
  String country = "";
  String price = "";
  String available = "";
  String moreInfo = "";
  String shipping = "";
  String visitLink = "";

  factory WhereToBuyModel.fromJson(Map<String, dynamic> json) => _$WhereToBuyModelFromJson(json);

  Map<String, dynamic> toJson() => _$WhereToBuyModelToJson(this);

  WhereToBuyModel({
    this.id = "",
    this.nameSeller = "",
    this.subtitle = "",
    this.country = "",
    this.price = "",
    this.available = "",
    this.moreInfo = "",
    this.shipping = "",
    this.visitLink = "",
  });
}