import '../product_home/model_product_home.dart';

class ProductDetailsResponse {
  int? code;
  ProductHome? data;

  ProductDetailsResponse({this.code, this.data});

  ProductDetailsResponse.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    data = (json['data'] != null ? ProductHome.fromJson(json['data']) : null)!;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    if (this.data != null) {
      data['data'] = this.data?.toJson();
    }

    return data;
  }
}
