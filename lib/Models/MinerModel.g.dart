// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'MinerModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MinerModel _$MinerModelFromJson(Map<String, dynamic> json) => MinerModel(
      model: json['model'] as String? ?? "",
      color: json['color'] as String? ?? "yellow",
      release: json['release'] as String? ?? "Coming soon",
      hashrate: json['hashrate'] as String? ?? "0",
      power: json['power'] as String? ?? "0",
      noise: json['noise'] as String? ?? "0",
      algo: json['algo'] as String? ?? "EtHash",
      visitLink: json['visitLink'] as String? ?? "",
      minableCoinList: (json['minableCoinList'] as List<dynamic>?)
              ?.map((e) => MinableCoinModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      whereToBuyList: (json['whereToBuyList'] as List<dynamic>?)
              ?.map((e) => WhereToBuyModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      miningPoolList: (json['miningPoolList'] as List<dynamic>?)
              ?.map((e) => MiningPoolModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    )..hashrateUnits = json['hashrateUnits'] as String;

Map<String, dynamic> _$MinerModelToJson(MinerModel instance) =>
    <String, dynamic>{
      'minableCoinList':
          instance.minableCoinList.map((e) => e.toJson()).toList(),
      'whereToBuyList': instance.whereToBuyList.map((e) => e.toJson()).toList(),
      'miningPoolList': instance.miningPoolList.map((e) => e.toJson()).toList(),
      'model': instance.model,
      'color': instance.color,
      'release': instance.release,
      'hashrate': instance.hashrate,
      'hashrateUnits': instance.hashrateUnits,
      'power': instance.power,
      'noise': instance.noise,
      'algo': instance.algo,
      'visitLink': instance.visitLink,
    };
