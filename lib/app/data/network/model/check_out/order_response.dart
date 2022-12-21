class OrderSuccessResponse {
  String? orderId;

  OrderSuccessResponse({this.orderId});

  OrderSuccessResponse.fromJson(Map<String, dynamic> json) {
    orderId = json['userId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['userId'] = orderId;

    return data;
  }
}
