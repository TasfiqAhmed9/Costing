// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Product _$ProductFromJson(Map<String, dynamic> json) => Product(
      id: json['id'] as String?,
      name: json['name'] as String?,
      description: json['description'] as String?,
      category_top: json['category_top'] as String?,
      category_mid: json['category_mid'] as String?,
      image: json['image'] as String?,
      accessories: json['accessories'] as String?,
      aop: json['aop'] as String?,
      buyinghouse_commision:
          (json['buyinghouse_commision'] as num?)?.toDouble(),
      embrodery: json['embrodery'] as String?,
      print: json['print'] as String?,
      quantity: (json['quantity'] as num?)?.toDouble(),
      rmg_cost: (json['rmg_cost'] as num?)?.toDouble(),
      shipping_cost: (json['shipping_cost'] as num?)?.toDouble(),
      size: json['size'] as String?,
      special_cost: (json['special_cost'] as num?)?.toDouble(),
      wash: json['wash'] as String?,
    );

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'image': instance.image,
      'description': instance.description,
      'category_top': instance.category_top,
      'category_mid': instance.category_mid,
      'quantity': instance.quantity,
      'size': instance.size,
      'embrodery': instance.embrodery,
      'print': instance.print,
      'wash': instance.wash,
      'aop': instance.aop,
      'accessories': instance.accessories,
      'rmg_cost': instance.rmg_cost,
      'special_cost': instance.special_cost,
      'shipping_cost': instance.shipping_cost,
      'buyinghouse_commision': instance.buyinghouse_commision,
    };
