import 'package:dio/dio.dart';
import 'package:tut_app/data/network/failure.dart';

import '../../presentation/resources/string_manger.dart';

class ErrorHandler implements Exception {
  late Failure failure;

  ErrorHandler.handle(dynamic error) {
    if (error is DioException) {
      // dio error so its an error from response of the API or from dio itself
      failure = _handleError(error);
    } else {
      // default error
      failure = DataSource.DEFAULT.getFailure();
    }
  }
}

Failure _handleError(DioException err) {
  switch (err.type) {
    case DioExceptionType.connectionTimeout:
      return DataSource.CONNECT_TIMEOUT.getFailure();
    case DioExceptionType.sendTimeout:
      return DataSource.SEND_TIMEOUT.getFailure();
    case DioExceptionType.receiveTimeout:
      return DataSource.RECIVE_TIMEOUT.getFailure();
    case DioExceptionType.badCertificate:
      return DataSource.FORBIDDEN.getFailure();
    case DioExceptionType.badResponse:
      if (err.response != null &&
          err.response?.statusCode != null &&
          err.response?.statusMessage != null) {
        return Failure(
          err.response?.statusCode ?? 0,
          err.response?.statusMessage ?? '',
        );
      } else {
        return DataSource.DEFAULT.getFailure();
      }

    case DioExceptionType.cancel:
      return DataSource.CANCEL.getFailure();
    case DioExceptionType.connectionError:
      return DataSource.NO_INTERNET_CONNECTION.getFailure();
    case DioExceptionType.unknown:
      return DataSource.DEFAULT.getFailure();
  }
}

enum DataSource {
  SUCCESS,
  NO_CONTENT,
  BAD_REQUEST,
  FORBIDDEN,
  UNAUTORISED,
  NOT_FOUND,
  INTERNAL_SERVER_ERROR,
  CONNECT_TIMEOUT,
  CANCEL,
  RECIVE_TIMEOUT,
  SEND_TIMEOUT,
  CACHE_ERROR,
  NO_INTERNET_CONNECTION,
  DEFAULT,
}

extension DataSourceExtension on DataSource {
  Failure getFailure() {
    switch (this) {
      case DataSource.SUCCESS:
        return Failure(ResponseCode.SUCCESS, ResponseMessage.SUCCESS.trim());
      case DataSource.NO_CONTENT:
        return Failure(
            ResponseCode.NO_CONTENT, ResponseMessage.NO_CONTENT.trim());
      case DataSource.BAD_REQUEST:
        return Failure(
            ResponseCode.BAD_REQUEST, ResponseMessage.BAD_REQUEST.trim());
      case DataSource.FORBIDDEN:
        return Failure(
            ResponseCode.FORBIDDEN, ResponseMessage.FORBIDDEN.trim());
      case DataSource.RECIVE_TIMEOUT:
        return Failure(ResponseCode.RECIEVE_TIMEOUT,
            ResponseMessage.RECIEVE_TIMEOUT.trim());
      case DataSource.NOT_FOUND:
        return Failure(
            ResponseCode.NOT_FOUND, ResponseMessage.NOT_FOUND.trim());
      case DataSource.INTERNAL_SERVER_ERROR:
        return Failure(ResponseCode.INTERNAL_SERVER_ERROR,
            ResponseMessage.INTERNAL_SERVER_ERROR.trim());
      case DataSource.CONNECT_TIMEOUT:
        return Failure(ResponseCode.CONNECT_TIMEOUT,
            ResponseMessage.CONNECT_TIMEOUT.trim());
      case DataSource.CANCEL:
        return Failure(ResponseCode.CANCEL, ResponseMessage.CANCEL.trim());
      case DataSource.SEND_TIMEOUT:
        return Failure(
            ResponseCode.SEND_TIMEOUT, ResponseMessage.SEND_TIMEOUT.trim());
      case DataSource.CACHE_ERROR:
        return Failure(
            ResponseCode.CACHE_ERROR, ResponseMessage.CACHE_ERROR.trim());
      case DataSource.NO_INTERNET_CONNECTION:
        return Failure(ResponseCode.NO_INTERNET_CONNECTION,
            ResponseMessage.NO_INTERNET_CONNECTION.trim());
      case DataSource.DEFAULT:
        return Failure(ResponseCode.DEFAULT, ResponseMessage.DEFAULT.trim());

      case DataSource.UNAUTORISED:
        return Failure(
            ResponseCode.UNAUTORISED, ResponseMessage.UNAUTORISED.trim());
    }
  }
}

class ResponseCode {
  static const int SUCCESS = 200; // success with data
  static const int NO_CONTENT = 201; // success with no data (no content)
  static const int BAD_REQUEST = 400; // failure, API rejected request
  static const int UNAUTORISED = 401; // failure, user is not authorised
  static const int FORBIDDEN = 403; //  failure, API rejected request
  static const int INTERNAL_SERVER_ERROR = 500; // failure, crash in server side
  static const int NOT_FOUND = 404; // failure, not found

  // local status code
  static const int CONNECT_TIMEOUT = -1;
  static const int CANCEL = -2;
  static const int RECIEVE_TIMEOUT = -3;
  static const int SEND_TIMEOUT = -4;
  static const int CACHE_ERROR = -5;
  static const int NO_INTERNET_CONNECTION = -6;
  static const int DEFAULT = -7;
}

class ResponseMessage {
  static const String SUCCESS = AppString.success; // success with data
  static const String NO_CONTENT =
      AppString.success; // success with no data (no content)
  static const String BAD_REQUEST =
      AppString.badRequestError; // failure, API rejected request
  static const String UNAUTORISED =
      AppString.unauthorizedError; // failure, user is not authorised
  static const String FORBIDDEN =
      AppString.forbiddenError; //  failure, API rejected request
  static const String INTERNAL_SERVER_ERROR =
      AppString.internalServerError; // failure, crash in server side
  static const String NOT_FOUND =
      AppString.notFoundError; // failure, crash in server side

  // local status code
  static const String CONNECT_TIMEOUT = AppString.timeoutError;
  static const String CANCEL = AppString.defaultError;
  static const String RECIEVE_TIMEOUT = AppString.timeoutError;
  static const String SEND_TIMEOUT = AppString.timeoutError;
  static const String CACHE_ERROR = AppString.cacheError;
  static const String NO_INTERNET_CONNECTION = AppString.noInternetError;
  static const String DEFAULT = AppString.defaultError;
}

class ApiInternalStatus {
  static const int SUCCESS = 0;
  static const int FAILURE = 1;
}
