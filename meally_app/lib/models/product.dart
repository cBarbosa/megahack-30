import 'dart:convert';

Product productFromJson(String str) => Product.fromJson(json.decode(str));

String productToJson(Product data) => json.encode(data.toJson());

class Product {
  Product({
    this.id,
    this.title,
    this.currencyId,
    this.pictureUrl,
    this.description,
    this.categoryId,
    this.quantity,
    this.unitPrice,
  });

  String id;
  String title;
  String currencyId;
  String pictureUrl;
  String description;
  String categoryId;
  int quantity;
  double unitPrice;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        title: json["title"],
        currencyId: json["currency_id"],
        pictureUrl: json["picture_url"],
        description: json["description"],
        categoryId: json["category_id"],
        quantity: json["quantity"],
        unitPrice: json["unit_price"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "currency_id": currencyId,
        "picture_url": pictureUrl,
        "description": description,
        "category_id": categoryId,
        "quantity": quantity,
        "unit_price": unitPrice,
      };
}
