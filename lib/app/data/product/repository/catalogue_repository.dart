import '../model/data_model.dart';
import '../model/product_catelog_response.dart';

abstract class CatalogueRepository {
  Future<ProductCatalogResponse> getDetails();
}
