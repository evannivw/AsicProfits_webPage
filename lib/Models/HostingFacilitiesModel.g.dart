// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'HostingFacilitiesModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HostingFacilitiesModel _$HostingFacilitiesModelFromJson(
        Map<String, dynamic> json) =>
    HostingFacilitiesModel(
      id: json['id'] as String? ?? "",
      namePlace: json['namePlace'] as String? ?? "",
      nameState: json['nameState'] as String? ?? "",
      nameCountry: json['nameCountry'] as String? ?? "",
      status: json['status'] as String? ?? "Available",
      price: json['price'] as String? ?? "",
      security: json['security'] as String? ?? "",
      MQO: json['MQO'] as String? ?? "",
      energy: json['energy'] as String? ?? "Green",
      imageURL: json['imageURL'] as String? ?? "",
      visitLink: json['visitLink'] as String? ?? "",
      date:
          json['date'] == null ? null : DateTime.parse(json['date'] as String),
    );

Map<String, dynamic> _$HostingFacilitiesModelToJson(
        HostingFacilitiesModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'namePlace': instance.namePlace,
      'nameState': instance.nameState,
      'nameCountry': instance.nameCountry,
      'status': instance.status,
      'price': instance.price,
      'security': instance.security,
      'MQO': instance.MQO,
      'energy': instance.energy,
      'imageURL': instance.imageURL,
      'visitLink': instance.visitLink,
      'date': instance.date?.toIso8601String(),
    };
