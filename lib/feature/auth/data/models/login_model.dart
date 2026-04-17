import 'package:save_plant/core/networking/api_constant.dart';

class SignInModel {
  final String? token;
  final String? message;

  SignInModel({this.token, this.message});

  factory SignInModel.fromJson(Map<String, dynamic> json) {
    return SignInModel(
      token: json[ApiKey.access_token] as String? ?? '',
      message:
          (json[ApiKey.detail] as String?) ?? (json['detail'] as String?) ?? '',
    );
  }
}
