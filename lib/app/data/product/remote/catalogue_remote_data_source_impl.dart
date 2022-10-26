import '/app/core/base/base_remote_source.dart';
import '../model/data_model.dart';
import 'catalogue_remote_data_source.dart';

class CatalogueRemoteDataSourceImpl extends BaseRemoteSource
    implements CatalogueRemoteDataSource {
  @override
  Future<Data> getDetails() {
    return Future(() => Data("sample"));
  }
}
