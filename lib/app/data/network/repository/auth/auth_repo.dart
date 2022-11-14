import '../../../../modules/auth/model/user.dart';
import '../../model/auth/registration_success.dart';
import '../../model/auth/send_otp_success.dart';

abstract class AuthRepo {
  Future<String> sendOTP(String numberOrEmail);
  Future<String> signIn(String numberOrEmail,String password);
  Future<RegistrationSuccessResponse> registerUser(User user);
}
