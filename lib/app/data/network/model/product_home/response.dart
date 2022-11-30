import 'home.dart';

class ProductHomeResponse {
  dynamic code;
  List<ProductHome>? productHome;

  ProductHomeResponse({code, data});

  ProductHomeResponse.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    if (json['data'] != null) {
      productHome = <ProductHome>[];
      json['data'].forEach((v) {
        productHome?.add(ProductHome.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['data'] = this.productHome?.map((v) => v.toJson()).toList();

    return data;
  }
}

