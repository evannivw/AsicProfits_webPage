// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'MiningPoolModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MiningPoolModel _$MiningPoolModelFromJson(Map<String, dynamic> json) =>
    MiningPoolModel(
      id: json['id'] as String? ?? "",
      imageURL: json['imageURL'] as String? ?? "",
      name: json['name'] as String? ?? "",
      webPage: json['webPage'] as String? ?? "",
      miningPlans: (json['miningPlans'] as List<dynamic>?)
              ?.map((e) => MinableCoinModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      referalCode: json['referalCode'] as String? ?? "",
      fees: json['fees'] as String? ?? "",
      visitLink: json['visitLink'] as String? ?? "",
    );

Map<String, dynamic> _$MiningPoolModelToJson(MiningPoolModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'imageURL': instance.imageURL,
      'name': instance.name,
      'webPage': instance.webPage,
      'miningPlans': instance.miningPlans.map((e) => e.toJson()).toList(),
      'referalCode': instance.referalCode,
      'fees': instance.fees,
      'visitLink': instance.visitLink,
    };
