import 'package:save_plant/core/networking/api_constant.dart';

class SignUpModel {
  final String message;

  SignUpModel({required this.message});

  factory SignUpModel.fromJson(Map<String, dynamic> json) {
    return SignUpModel(message: json[ApiKey.detail] ?? json['message'] ?? '');
  }
}
