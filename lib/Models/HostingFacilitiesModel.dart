import 'dart:ui';

import 'package:asic_miner_website/Helpers/UIHelper.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

/// This allows the `MinerModel` class to access private members in
/// the generated file. The value for this is *.g.dart, where
/// the star denotes the source file name.
part 'HostingFacilitiesModel.g.dart';


@JsonSerializable(explicitToJson: true)
class HostingFacilitiesModel
{
  String _id = "";
  String _namePlace = "";
  String _nameState = "";
  String _nameCountry = "";
  String _status = "OK";
  String _price = "";
  String _security = "";
  String _MQO = "";
  String _energy = "";
  String imageURL = "";
  String visitLink = "";


  ///Get secction
  String get namePlace => _namePlace;
  String get nameState => _nameState;
  String get nameCountry => _nameCountry;
  String get status => _status;
  String get price => _price;
  String get security => _security;
  String get MQO => _MQO;
  String get energy => _energy;
  String get id => _id;
  
  
  ///Set secction
  set namePlace(String value)
  {
    _namePlace = value;
  }
  set nameState(String value)
  {
    _nameState = value;
  }
  set nameCountry(String value)
  {
    _nameCountry = value;
  }
  set status(String value)
  {
    _status = value;
  }
  set price(String value)
  {
    _price = value;
  }
  set security(String value)
  {
    _security = value;
  }
  set MQO(String value)
  {
    _MQO = value;
  }
  set energy(String value)
  {
    _energy = value;
  }
  


  factory HostingFacilitiesModel.fromJson(Map<String, dynamic> json) => _$HostingFacilitiesModelFromJson(json);

  Map<String, dynamic> toJson() => _$HostingFacilitiesModelToJson(this);


  ///Init secction
  HostingFacilitiesModel(
    {
      String id = "",
      String namePlace = "",
      String nameState = "",
      String nameCountry = "",
      String status = "Available",
      String price = "",
      String security = "",
      String MQO = "",
      String energy = "Green",
      String imageURL = "",
      String visitLink = "",
    }
  ){
    _id = id;
    _namePlace = namePlace;
    _nameState = nameState;
    _nameCountry = nameCountry;
    _status = status;
    _price = price;
    _security = security;
    _MQO = MQO;
    _energy = energy;
    this.imageURL = imageURL;
    this.visitLink = visitLink;
  }
}