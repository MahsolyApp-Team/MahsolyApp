import 'package:dio/dio.dart';
import 'package:save_plant/core/errors/error_model.dart';

class ServerException implements Exception {
  final ErrorModel errModel;
  ServerException({required this.errModel});
}

ErrorModel _fromResponse(DioException e) {
  final data = e.response?.data;
  if (data is Map<String, dynamic>) {
    return ErrorModel.fromJson(data);
  }
  return ErrorModel(errorMessage: 'Something went wrong');
}

Never handleDioExceptions(DioException e) {
  switch (e.type) {
    case DioExceptionType.connectionTimeout:
      throw ServerException(
        errModel: ErrorModel(errorMessage: 'Connection timeout, try again'),
      );
    case DioExceptionType.sendTimeout:
      throw ServerException(
        errModel: ErrorModel(errorMessage: 'Send timeout, try again'),
      );
    case DioExceptionType.receiveTimeout:
      throw ServerException(
        errModel: ErrorModel(errorMessage: 'Receive timeout, try again'),
      );
    case DioExceptionType.badCertificate:
      throw ServerException(
        errModel: ErrorModel(errorMessage: 'Bad certificate'),
      );
    case DioExceptionType.cancel:
      throw ServerException(
        errModel: ErrorModel(errorMessage: 'Request was cancelled'),
      );
    case DioExceptionType.connectionError:
      throw ServerException(
        errModel: ErrorModel(errorMessage: 'No internet connection'),
      );
    case DioExceptionType.unknown:
      throw ServerException(
        errModel: ErrorModel(errorMessage: 'Unexpected error occurred'),
      );
    case DioExceptionType.badResponse:
      throw ServerException(errModel: _fromResponse(e));
  }
}
