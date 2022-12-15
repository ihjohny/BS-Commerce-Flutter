import 'photos.dart';

class Products {
  String? productId;
  String? name;
  int? price;
  int? totalPrice;
  int? quantity;
  String? sku;
  List<Photos>? photos;

  Products(
      {this.productId,
        this.name,
        this.price,
        this.totalPrice,
        this.quantity,
        this.sku,
        this.photos});

  Products.fromJson(Map<String, dynamic> json) {
    productId = json['productId'];
    name = json['name'];
    price = json['price'];
    totalPrice = json['totalPrice'];
    quantity = json['quantity'];
    sku = json['sku'];
    if (json['photos'] != null) {
      photos = <Photos>[];
      json['photos'].forEach((v) {
        photos!.add(Photos.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['productId'] = productId;
    data['name'] = name;
    data['price'] = price;
    data['totalPrice'] = totalPrice;
    data['quantity'] = quantity;
    data['sku'] = sku;
    if (photos != null) {
      data['photos'] = photos!.map((v) => v.toJson()).toList();
    }

    return data;
  }
}
