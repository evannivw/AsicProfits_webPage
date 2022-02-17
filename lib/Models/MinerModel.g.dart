// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'MinerModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MinerModel _$MinerModelFromJson(Map<String, dynamic> json) => MinerModel(
      id: json['id'] as String? ?? "",
      model: json['model'] as String? ?? "N/A",
      color: json['color'] as String? ?? "yellow",
      release: json['release'] as String? ?? "Coming soon",
      hashrate: json['hashrate'] as String? ?? "0",
      hashrateUnits: json['hashrateUnits'] as String? ?? "H/s",
      power: json['power'] as String? ?? "0",
      noise: json['noise'] as String? ?? "0",
      algo: json['algo'] as String? ?? "EtHash",
      visitLink: json['visitLink'] as String? ?? "",
      costPerKW: json['costPerKW'] as num? ?? 0,
      poolFee: json['poolFee'] as String? ?? "",
      manu: json['manu'] as String? ?? "0",
      desc: json['desc'] as String? ?? "0",
      voltage: json['voltage'] as String? ?? "0",
      fans: json['fans'] as String? ?? "0",
      interface: json['interface'] as String? ?? "Ethernet",
      temperature: json['temperature'] as String? ?? "0",
      humidity: json['humidity'] as String? ?? "0",
      weight: json['weight'] as String? ?? "0",
      size: json['size'] as String? ?? "0",
      efficiency: json['efficiency'] as String? ?? "0",
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
      date:
          json['date'] == null ? null : DateTime.parse(json['date'] as String),
      imageURL: json['imageURL'] as String? ?? "",
      status: json['status'] as String? ?? "",
      profitability: json['profitability'] as num? ?? 0,
    );

Map<String, dynamic> _$MinerModelToJson(MinerModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'model': instance.model,
      'color': instance.color,
      'release': instance.release,
      'hashrate': instance.hashrate,
      'costPerKW': instance.costPerKW,
      'poolFee': instance.poolFee,
      'hashrateUnits': instance.hashrateUnits,
      'power': instance.power,
      'noise': instance.noise,
      'algo': instance.algo,
      'visitLink': instance.visitLink,
      'manu': instance.manu,
      'desc': instance.desc,
      'fans': instance.fans,
      'voltage': instance.voltage,
      'interface': instance.interface,
      'temperature': instance.temperature,
      'humidity': instance.humidity,
      'weight': instance.weight,
      'size': instance.size,
      'efficiency': instance.efficiency,
      'imageURL': instance.imageURL,
      'status': instance.status,
      'profitability': instance.profitability,
      'minableCoinList':
          instance.minableCoinList.map((e) => e.toJson()).toList(),
      'whereToBuyList': instance.whereToBuyList.map((e) => e.toJson()).toList(),
      'miningPoolList': instance.miningPoolList.map((e) => e.toJson()).toList(),
      'date': instance.date?.toIso8601String(),
    };
