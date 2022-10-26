import '../model/data_model.dart';

abstract class CatalogueRemoteDataSource {
  Future<Data> getDetails();
}
