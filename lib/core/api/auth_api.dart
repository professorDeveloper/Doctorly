
import '../../utils/response.dart';
import '../models/requests/auth/login_request.dart';
import '../models/requests/auth/register_request.dart';
import '../models/requests/auth/send_sms_code_request.dart';
import '../models/requests/verify/verify_request.dart';

abstract class AuthApi {
  Future<Result> sendSms({required SendSmsCodeRequest sendSmsCodeRequest});
  Future<Result> register({required RegisterRequest registerRequest});
  Future<Result> login({required LoginRequest loginRequest});
  Future<Result> verify({required VerifyRequest request});

}
