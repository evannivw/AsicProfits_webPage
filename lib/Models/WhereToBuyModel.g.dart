// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'WhereToBuyModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WhereToBuyModel _$WhereToBuyModelFromJson(Map<String, dynamic> json) =>
    WhereToBuyModel(
      nameSeller: json['nameSeller'] as String? ?? "",
      subtitle: json['subtitle'] as String? ?? "",
      countryImageURL: json['countryImageURL'] as String? ?? "",
      price: json['price'] as String? ?? "",
      available: json['available'] as String? ?? "",
      moreInfo: json['moreInfo'] as String? ?? "",
      shipping: json['shipping'] as String? ?? "",
      visitLink: json['visitLink'] as String? ?? "",
    )..imageURL = json['imageURL'] as String;

Map<String, dynamic> _$WhereToBuyModelToJson(WhereToBuyModel instance) =>
    <String, dynamic>{
      'imageURL': instance.imageURL,
      'nameSeller': instance.nameSeller,
      'subtitle': instance.subtitle,
      'countryImageURL': instance.countryImageURL,
      'price': instance.price,
      'available': instance.available,
      'moreInfo': instance.moreInfo,
      'shipping': instance.shipping,
      'visitLink': instance.visitLink,
    };
