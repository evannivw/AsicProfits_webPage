import 'dart:ui';

import 'package:asic_miner_website/Helpers/UIHelper.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

/// This allows the `MinerModel` class to access private members in
/// the generated file. The value for this is *.g.dart, where
/// the star denotes the source file name.
part 'HostingFacilitiesModel.g.dart';

@JsonSerializable(explicitToJson: true)
class HostingFacilitiesModel {
  String id = "";
  String namePlace = "";
  String nameState = "";
  String nameCountry = "";
  String status = "OK";
  String price = "";
  String security = "";
  String MQO = "";
  String energy = "";
  String imageURL = "";
  String visitLink = "";
  DateTime? date;

  factory HostingFacilitiesModel.fromJson(Map<String, dynamic> json) =>
      _$HostingFacilitiesModelFromJson(json);

  Map<String, dynamic> toJson() => _$HostingFacilitiesModelToJson(this);

  ///Init secction
  HostingFacilitiesModel({
    this.id = "",
    this.namePlace = "",
    this.nameState = "",
    this.nameCountry = "",
    this.status = "Available",
    this.price = "",
    this.security = "",
    this.MQO = "",
    this.energy = "Green",
    this.imageURL = "",
    this.visitLink = "",
    this.date,
  });
}
