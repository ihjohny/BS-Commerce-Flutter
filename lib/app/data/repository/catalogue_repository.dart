import '../model/data_model.dart';

abstract class CatalogueRepository {
  Future<Data> getDetails();
}
