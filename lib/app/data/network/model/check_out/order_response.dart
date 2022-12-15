import 'package:bs_commerce/app/data/network/model/check_out/products.dart';

import 'check_out_address.dart';

class OrderResponse {
  String? orderId;
  String? userId;
  CheckOutAddress? billingAddress;
  CheckOutAddress? shippingAddress;
  String? shippingMethod;
  String? paymentMethod;
  String? orderStatus;
  String? shippingStatus;
  String? paymentStatus;
  List<Products>? products;
  int? productCost;
  int? shippingCost;
  int? totalCost;
  String? stripeToken;
  String? stripeCustomerId;
  String? stripeChargeId;
  String? paypalPaymentId;
  String? paypalRedirectUrl;
  String? orderedDate;

  OrderResponse(
      {this.orderId,
      this.userId,
      this.billingAddress,
      this.shippingAddress,
      this.shippingMethod,
      this.paymentMethod,
      this.orderStatus,
      this.shippingStatus,
      this.paymentStatus,
      this.products,
      this.productCost,
      this.shippingCost,
      this.totalCost,
      this.stripeToken,
      this.stripeCustomerId,
      this.stripeChargeId,
      this.paypalPaymentId,
      this.paypalRedirectUrl,
      this.orderedDate});

  OrderResponse.fromJson(Map<String, dynamic> json) {
    orderId = json['orderId'];
    userId = json['userId'];
    billingAddress = json['billingAddress'] != null
        ? CheckOutAddress.fromJson(json['billingAddress'])
        : null;
    shippingAddress = json['shippingAddress'] != null
        ? CheckOutAddress.fromJson(json['shippingAddress'])
        : null;
    shippingMethod = json['shippingMethod'];
    paymentMethod = json['paymentMethod'];
    orderStatus = json['orderStatus'];
    shippingStatus = json['shippingStatus'];
    paymentStatus = json['paymentStatus'];
    if (json['products'] != null) {
      products = <Products>[];
      json['products'].forEach((v) {
        products!.add(Products.fromJson(v));
      });
    }
    productCost = json['productCost'];
    shippingCost = json['shippingCost'];
    totalCost = json['totalCost'];
    stripeToken = json['stripeToken'];
    stripeCustomerId = json['stripeCustomerId'];
    stripeChargeId = json['stripeChargeId'];
    paypalPaymentId = json['paypalPaymentId'];
    paypalRedirectUrl = json['paypalRedirectUrl'];
    orderedDate = json['orderedDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['orderId'] = orderId;
    data['userId'] = userId;
    if (billingAddress != null) {
      data['billingAddress'] = billingAddress!.toJson();
    }
    if (shippingAddress != null) {
      data['shippingAddress'] = shippingAddress!.toJson();
    }
    data['shippingMethod'] = shippingMethod;
    data['paymentMethod'] = paymentMethod;
    data['orderStatus'] = orderStatus;
    data['shippingStatus'] = shippingStatus;
    data['paymentStatus'] = paymentStatus;
    if (products != null) {
      data['products'] = products!.map((v) => v.toJson()).toList();
    }
    data['productCost'] = productCost;
    data['shippingCost'] = shippingCost;
    data['totalCost'] = totalCost;
    data['stripeToken'] = stripeToken;
    data['stripeCustomerId'] = stripeCustomerId;
    data['stripeChargeId'] = stripeChargeId;
    data['paypalPaymentId'] = paypalPaymentId;
    data['paypalRedirectUrl'] = paypalRedirectUrl;
    data['orderedDate'] = orderedDate;

    return data;
  }
}
