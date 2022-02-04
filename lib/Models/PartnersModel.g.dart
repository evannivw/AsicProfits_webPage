// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'PartnersModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PartnersModel _$PartnersModelFromJson(Map<String, dynamic> json) =>
    PartnersModel(
      id: json['id'] as String? ?? "",
      imageURL: json['imageURL'] as String? ?? "",
      name: json['name'] as String? ?? "",
      webPage: json['webPage'] as String? ?? "",
      countryImageURL: json['countryImageURL'] as String? ?? "",
      countryName: json['countryName'] as String? ?? "",
      distributor: json['distributor'] as String? ?? "",
      payment: json['payment'] as String? ?? "",
      trust: json['trust'] as String? ?? "",
      visitLink: json['visitLink'] as String? ?? "",
    );

Map<String, dynamic> _$PartnersModelToJson(PartnersModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'imageURL': instance.imageURL,
      'name': instance.name,
      'webPage': instance.webPage,
      'countryImageURL': instance.countryImageURL,
      'countryName': instance.countryName,
      'distributor': instance.distributor,
      'payment': instance.payment,
      'trust': instance.trust,
      'visitLink': instance.visitLink,
    };
