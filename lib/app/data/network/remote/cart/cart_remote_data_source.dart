abstract class CartRemoteDataSource {
  Future addToCart(String productId, int quantity);
  Future getCart();

}
