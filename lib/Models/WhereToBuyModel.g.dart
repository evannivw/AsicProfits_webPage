// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'WhereToBuyModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WhereToBuyModel _$WhereToBuyModelFromJson(Map<String, dynamic> json) =>
    WhereToBuyModel(
      id: json['id'] as String? ?? "",
      nameSeller: json['nameSeller'] as String? ?? "",
      subtitle: json['subtitle'] as String? ?? "",
      country: json['country'] as String? ?? "",
      price: json['price'] as String? ?? "",
      available: json['available'] as String? ?? "",
      moreInfo: json['moreInfo'] as String? ?? "",
      shipping: json['shipping'] as String? ?? "",
      visitLink: json['visitLink'] as String? ?? "",
    )..imageURL = json['imageURL'] as String;

Map<String, dynamic> _$WhereToBuyModelToJson(WhereToBuyModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'imageURL': instance.imageURL,
      'nameSeller': instance.nameSeller,
      'subtitle': instance.subtitle,
      'country': instance.country,
      'price': instance.price,
      'available': instance.available,
      'moreInfo': instance.moreInfo,
      'shipping': instance.shipping,
      'visitLink': instance.visitLink,
    };
