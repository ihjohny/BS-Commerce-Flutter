import 'check_out_address.dart';
import 'products.dart';

class OrderPayload {
  int? shippingCost;
  CheckOutAddress? billingAddress;
  CheckOutAddress? shippingAddress;
  String? shippingMethod;
  String? paymentMethod;
  int? productCost;
  List<Products>? products;
  String? stripeToken;
  String? stripeCustomerId;
  String? stripeChargeId;
  String? paypalPaymentId;
  String? paypalRedirectUrl;

  OrderPayload(
      {this.shippingCost,
      this.billingAddress,
      this.shippingAddress,
      this.shippingMethod,
      this.paymentMethod,
      this.productCost,
      this.products,
      this.stripeToken,
      this.stripeCustomerId,
      this.stripeChargeId,
      this.paypalPaymentId,
      this.paypalRedirectUrl});
}
