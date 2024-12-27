import 'dart:convert';

import 'package:doctorly/core/constants/keys.dart';
import 'package:http/http.dart' as http;

import '../../utils/my_pref.dart';
import '../../utils/response.dart';
import '../models/requests/auth/login_request.dart';
import '../models/requests/auth/send_sms_code_request.dart';
import '../models/requests/verify/verify_request.dart';
import '../models/responses/auth/error_response.dart';
import '../models/responses/auth/login_response.dart';
import '../models/responses/auth/send_sms_code_response.dart';
import 'auth_api.dart';

class AuthApiImpl implements AuthApi {
  @override
  Future<Result> sendSms(
      {required SendSmsCodeRequest sendSmsCodeRequest}) async {
    try {
      final response1 = await http.post(
          Uri.parse("${Keys.baseUrl}/accounts/verify-phone/"),
          body: sendSmsCodeRequest.toJson());
      print(response1.body);

      if (response1.statusCode == 200) {
        Map<String, dynamic> jsonMap = json.decode(response1.body);
        var sendSmsResponse = SendSmsCodeResponse.fromJson(jsonMap);

        // Return a Success result with the login response data
        return Success(sendSmsResponse);
      } else {
        // If the response is not successful, handle the error
        var errorResponse = ErrorResponse.fromJson(json.decode(response1.body));

        return Error(errorResponse.detail.toString());
      }
    } catch (e) {
      // Handle other types of exceptions, e.g., network errors
      throw Exception(e);
    }
  }

  @override
  Future<Result> verify({required VerifyRequest request}) async {
    try {
      print(request.toJson());
      String bodyData =
          jsonEncode({"code": "${request.code}", "phone": "+${request.phone}"});
      final response = await http.post(
          Uri.parse("${Keys.baseUrl}/accounts/verify-code/"),
          headers: {"Content-Type": "application/json"},
          body: bodyData);
      print(response.body);
      if (response.statusCode == 200) {
        Map<String, dynamic> jsonMap = json.decode(response.body);
        print(jsonMap.toString());
        var verifyResponse = SendSmsCodeResponse.fromJson(jsonMap);
        return Success(verifyResponse);
      } else {
        var errorResponse = ErrorResponse.fromJson(json.decode(response.body));
        print("Fail ::::" + response.body);
        return Error(errorResponse.detail.toString());
      }
    } catch (e) {
      throw Exception(e);
    }

    throw UnimplementedError();
  }

  @override
  Future<Result> login({required LoginRequest loginRequest}) async {
    try {
      final response1 = await http.post(
          Uri.parse("${Keys.baseUrl}/accounts/token/"),
          body: loginRequest.toJson());
      print(response1.body);

      if (response1.statusCode == 200) {
        Map<String, dynamic> jsonMap = json.decode(response1.body);
        var loginResponse = LoginResponse.fromJson(jsonMap);
        init();
        Prefs.setUserPassword(loginRequest.password!);
        Prefs.setUserPhone(loginRequest.phone!);

        // Return a Success result with the login response data
        return Success(loginResponse);
      } else {
        // If the response is not successful, handle the error
        var errorData = json.decode(response1.body);

        return Error(ErrorResponse.fromJson(errorData).detail!);
      }
    } catch (e) {
      // Handle other types of exceptions, e.g., network errors
      throw Exception(e);
    }
  }

  Future init() async {
    await Prefs.init();
  }
}
