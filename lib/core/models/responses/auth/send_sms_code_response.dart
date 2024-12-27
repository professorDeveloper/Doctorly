import 'package:json_annotation/json_annotation.dart';


@JsonSerializable()
class SendSmsCodeResponse {
  final String message;
  final String token;

  const SendSmsCodeResponse({
    required this.message,
    required this.token,
  });
  factory SendSmsCodeResponse.fromJson(Map<String, dynamic> json) =>
      SendSmsCodeResponse(
        message: json['message']   ?? "",
        token: json['token']  ?? "",
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
  };

}
