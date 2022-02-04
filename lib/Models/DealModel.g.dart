// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'DealModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DealModel _$DealModelFromJson(Map<String, dynamic> json) => DealModel(
      id: json['id'] as String? ?? "",
      price: json['price'] as String? ?? "",
      spots: json['spots'] as String? ?? "",
      miner: json['miner'] == null
          ? null
          : MinerModel.fromJson(json['miner'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DealModelToJson(DealModel instance) => <String, dynamic>{
      'id': instance.id,
      'price': instance.price,
      'spots': instance.spots,
      'miner': instance.miner?.toJson(),
    };
