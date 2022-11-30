import 'package:bs_commerce/app/core/values/app_values.dart';
import 'package:bs_commerce/app/modules/auth/model/user.dart';
import 'package:bs_commerce/app/network/dio_provider.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

import '../../../../core/base/base_remote_source.dart';
import '../../model/auth/registration_success.dart';
import '../../model/auth/send_otp_success.dart';
import 'auth_remote_data_source.dart';

class AuthDataSourceImp extends BaseRemoteSource implements AuthDataSource {
  @override
  Future<String> sendOTP(String numberOrEmail) {
    var endpoint = "${DioProvider.baseUrl}api/customer/auth/register/send-otp";
    var dioCall = dioClient.post(endpoint, data: {'phone': numberOrEmail});

    return callApiWithErrorParser(dioCall)
        .then((response) => _parseSendOtpSuccessResponse(response));
  }

  String _parseSendOtpSuccessResponse(Response<dynamic> response) {
    return SendOtpSuccessResponse.fromJson(response.data)
            .data
            ?.message
            ?.substring(AppValues.value_24, AppValues.value_30) ??
        "";
  }

  @override
  Future<RegistrationSuccessResponse> registerUser(User user) {
    var endpoint = "${DioProvider.baseUrl}api/customer/auth/register";
    var dioCall = dioClient.post(endpoint, data: {
      'phone': user.phoneOrEmail,
      "name": user.name,
      "otp": int.tryParse(user.otp),
      "password": user.password
    });

    return callApiWithErrorParser(dioCall).then((response) {
      return _parseRegistrationSuccessResponse(response);
    });
  }

  RegistrationSuccessResponse _parseRegistrationSuccessResponse(
      Response response) {
    return RegistrationSuccessResponse.fromJson(response.data);
  }

  @override
  Future<String> signIn(String numberOrEmail, String password) {
    var endpoint = "${DioProvider.baseUrl}api/customer/auth/sign-in";
    var dioCall = dioClient
        .post(endpoint, data: {'phone': numberOrEmail, "password": password});

    return callApiWithErrorParser(dioCall).then((response) {
      return Future(
          () => (response.data as Map<dynamic, dynamic>)["data"]["token"]);
    });
  }
}
