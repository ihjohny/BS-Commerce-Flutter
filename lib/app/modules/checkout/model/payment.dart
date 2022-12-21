class PaymentOption {
  final String paymentName;
  final String imageUrl;
  final String amount;
  bool isSelected;

  PaymentOption(
      {required this.paymentName,
      required this.amount,
      required this.imageUrl,
      this.isSelected = false});
}
