import 'package:dio/dio.dart';
import 'package:kanban_time_board/src/core/services/network/network_service_impl.dart';

import '../../di/di.dart';

abstract class NetworkService {
  const NetworkService();
  factory NetworkService.getInstance([String? baseUrl]) {
    if (!locator.isRegistered<NetworkService>() && baseUrl != null) {
      inject(createDefaultDio());
    }
    return locator<NetworkService>();
  }

  static void inject(Dio dio) {
    locator.registerSingleton<NetworkService>(DioNetworkService(dio));
  }

  Future<R> get<R>(
    Uri uri, {
    dynamic data,
    Map<String, String>? headers,
    R Function(dynamic)? successTransformer,
  });

  Future<R> post<R>(
    Uri uri, {
    dynamic data,
    Map<String, String>? headers,
    R Function(dynamic)? successTransformer,
  });

  Future<R> put<R>(
    Uri uri, {
    dynamic data,
    Map<String, String>? headers,
    R Function(dynamic)? successTransformer,
  });

  Future<R> delete<R>(
    Uri uri, {
    dynamic data,
    Map<String, String>? headers,
    R Function(dynamic)? successTransformer,
  });
}
