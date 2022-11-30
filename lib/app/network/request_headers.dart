import 'package:dio/dio.dart';
import 'package:get/get.dart';

import '../core/values/app_values.dart';
import '../data/local/preference/preference_manager.dart';
import '../data/network/remote/product_details/product_details_remote_data_source.dart';

class RequestHeaderInterceptor extends InterceptorsWrapper {
  final PreferenceManager _preferenceManager =
  Get.find(tag: (PreferenceManager).toString());
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    getCustomHeaders().then((customHeaders) {
      options.headers.addAll(customHeaders);
      super.onRequest(options, handler);
    });
  }

  Future<Map<String, String>> getCustomHeaders() async {
    String token= await _preferenceManager.getString(AppValues.AUTH_TOKEN);
    var customHeaders = {'content-type': 'application/json',"Authorization":"Bearer $token"};

    return customHeaders;
  }
}
