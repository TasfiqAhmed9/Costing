import 'package:json_annotation/json_annotation.dart';
part 'product.g.dart';

@JsonSerializable()
class Product {
  @JsonKey(name: "id")
  String? id;

  @JsonKey(name: "name")
  String? name;

  @JsonKey(name: "image")
  String? image;

  @JsonKey(name: "description")
  String? description;

  @JsonKey(name: "category_top")
  String? category_top;

  @JsonKey(name: "category_mid")
  String? category_mid;

  @JsonKey(name: "quantity")
  double? quantity;

  @JsonKey(name: "size")
  String? size;

  @JsonKey(name: "embrodery")
  String? embrodery;

  @JsonKey(name: "print")
  String? print;

  @JsonKey(name: "wash")
  String? wash;

  @JsonKey(name: "aop")
  String? aop;

  @JsonKey(name: "accessories")
  String? accessories;

  @JsonKey(name: "rmg_cost")
  double? rmg_cost;

  @JsonKey(name: "special_cost")
  double? special_cost;

  @JsonKey(name: "shipping_cost")
  double? shipping_cost;

  @JsonKey(name: "buyinghouse_commision")
  double? buyinghouse_commision;

  Product(
      {this.id,
      this.name,
      this.description,
      this.category_top,
      this.category_mid,
      this.image,
      this.accessories,
      this.aop,
      this.buyinghouse_commision,
      this.embrodery,
      this.print,
      this.quantity,
      this.rmg_cost,
      this.shipping_cost,
      this.size,
      this.special_cost,
      this.wash});

  factory Product.fromJson(Map<String, dynamic> json) => _$ProductFromJson(json);
  Map<String, dynamic> toJson() => _$ProductToJson(this);
}