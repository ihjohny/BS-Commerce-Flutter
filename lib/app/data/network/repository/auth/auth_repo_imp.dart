import 'package:bs_commerce/app/modules/auth/model/user.dart';
import 'package:get/get.dart';

import '../../model/auth/registration_success.dart';
import '../../remote/auth/auth_remote_data_source.dart';
import 'auth_repo.dart';

class AuthRepoImp extends AuthRepo {
  final AuthDataSource _remoteSource =
      Get.find(tag: (AuthDataSource).toString());

  @override
  Future<String> sendOTP(String numberOrEmail) {
    return _remoteSource.sendOTP(numberOrEmail);
  }

  @override
  Future<RegistrationSuccessResponse> registerUser(User user) {
    return _remoteSource.registerUser(user);
  }

  @override
  Future<String> signIn(String numberOrEmail, String password) {
    return _remoteSource.signIn(numberOrEmail, password);
  }
}
