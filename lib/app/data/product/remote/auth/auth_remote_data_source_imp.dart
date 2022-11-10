import 'package:bs_commerce/app/data/product/model/auth/registration_success.dart';
import 'package:bs_commerce/app/data/product/model/auth/send_otp_success.dart';
import 'package:bs_commerce/app/data/product/remote/auth/auth_remote_data_source.dart';
import 'package:bs_commerce/app/modules/auth/model/user.dart';
import 'package:bs_commerce/app/network/dio_provider.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

import '../../../../core/base/base_remote_source.dart';

class AuthDataSourceImp extends BaseRemoteSource implements AuthDataSource {
  @override
  Future<String> sendOTP(String numberOrEmail) {
    var endpoint = "${DioProvider.baseUrl}api/customer/auth/register/send-otp";
    var dioCall = dioClient.post(endpoint, data: {'phone': numberOrEmail});

    try {
      return callApiWithErrorParser(dioCall)
          .then((response) => _parseSendOtpSuccessResponse(response));
    } catch (e) {
      rethrow;
    }
  }

  String _parseSendOtpSuccessResponse(
      Response<dynamic> response) {
    return SendOtpSuccessResponse.fromJson(response.data).data?.message?.substring(24,30)??"";
  }

  @override
  Future<RegistrationSuccessResponse> registerUser(User user) {
    var endpoint = "${DioProvider.baseUrl}api/customer/auth/register/send-otp";
    var dioCall = dioClient.post(endpoint, data: {
      'phone': user.phoneOrEmail,
      "name": user.name,
      "otp": user.otp,
      "password": user.password
    });

    try {
      return callApiWithErrorParser(dioCall)
          .then((response){
            debugPrint(response.data);

            return _parseRegistrationSuccessResponse(response);
      });
    } catch (e) {
      rethrow;
    }
  }

  RegistrationSuccessResponse _parseRegistrationSuccessResponse(
      Response response) {
    return RegistrationSuccessResponse.fromJson(response.data);
  }

  @override
  Future<String> signIn(String numberOrEmail, String password) {
    var endpoint = "${DioProvider.baseUrl}api/customer/auth/sign-in";
    var dioCall = dioClient.post(endpoint, data: {
      'phone': numberOrEmail,
      "password": password
    });

    try {
      return callApiWithErrorParser(dioCall)
          .then((response){
        debugPrint(response.data.toString());

        return Future(() => "");
      });
    } catch (e) {
      rethrow;
    }
  }
}
