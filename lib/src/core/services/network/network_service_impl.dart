import 'dart:async';

import 'package:dio/dio.dart';

import 'package:kanban_time_board/src/core/constants/api_constants.dart';
import 'package:kanban_time_board/src/core/error/failure.dart';

import 'network_service.dart';

Dio createDefaultDio() {
  return Dio()
    ..options.baseUrl = ApiConstants.baseUrl
    ..options.responseType = ResponseType.json;
}

class DioNetworkService extends NetworkService {
  DioNetworkService(this._dio);
  final Dio _dio;

  /// Try/catch to wrap api calls
  Future<R> _performRequest<R>(
    Future<Response> apiCall,
    R Function(dynamic p1)? successTransformer,
  ) async {
    try {
      final response = await apiCall;
      return successTransformer?.call(response.data) ?? response.data;
    } on DioException catch (e) {
      throw TaskFailure(message: e.message ?? "");
    } catch (e) {
      throw TaskFailure(
        message:
            "There's a slight issue communicating with our server. Try again in a bit",
      );
    }
  }

  @override
  Future<R> delete<R>(
    Uri uri, {
    dynamic data,
    Map<String, String>? headers,
    R Function(dynamic p1)? successTransformer,
  }) {
    return _performRequest(
      _dio.deleteUri(
        uri,
        data: data,
        options: Options(headers: {...?headers, ..._dio.options.headers}),
      ),
      successTransformer,
    );
  }

  @override
  Future<R> get<R>(
    Uri uri, {
    dynamic data,
    Map<String, String>? headers,
    R Function(dynamic p1)? successTransformer,
  }) {
    return _performRequest(
      _dio.getUri(
        uri,
        data: data,
        options: Options(headers: {...?headers, ..._dio.options.headers}),
      ),
      successTransformer,
    );
  }

  @override
  Future<R> post<R>(
    Uri uri, {
    dynamic data,
    Map<String, String>? headers,
    R Function(dynamic p1)? successTransformer,
  }) {
    return _performRequest(
      _dio.postUri(
        uri,
        data: data,
        options: Options(headers: {...?headers, ..._dio.options.headers}),
      ),
      successTransformer,
    );
  }

  @override
  Future<R> put<R>(
    Uri uri, {
    dynamic data,
    Map<String, String>? headers,
    R Function(dynamic p1)? successTransformer,
  }) {
    return _performRequest(
      _dio.putUri(
        uri,
        data: data,
        options: Options(headers: {...?headers, ..._dio.options.headers}),
      ),
      successTransformer,
    );
  }
}
