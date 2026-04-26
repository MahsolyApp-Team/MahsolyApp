class ErrorModel {
  final String errorMessage;

  ErrorModel({required this.errorMessage});

  factory ErrorModel.fromJson(Map<String, dynamic> json) {
    return ErrorModel(
      errorMessage:
          json['detail'] as String? ??
          json['message'] as String? ??
          json['error'] as String? ??
          'Something went wrong',
    );
  }
}
