import 'package:asic_miner_website/Helpers/UIHelper.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

/// This allows the `MinerModel` class to access private members in
/// the generated file. The value for this is *.g.dart, where
/// the star denotes the source file name.
part 'MinableCoinModel.g.dart';

@JsonSerializable(explicitToJson: true)
class MinableCoinModel {
  String imageURL = "";

  factory MinableCoinModel.fromJson(Map<String, dynamic> json) =>
      _$MinableCoinModelFromJson(json);

  Map<String, dynamic> toJson() => _$MinableCoinModelToJson(this);

  MinableCoinModel({
    this.imageURL = "",
  });
}
