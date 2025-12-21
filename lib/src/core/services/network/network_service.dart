import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:kanban_time_board/src/core/services/network/network_service_impl.dart';

abstract class NetworkService {
  const NetworkService();
  factory NetworkService.getInstance([String? baseUrl]) {
    if (!GetIt.I.isRegistered<NetworkService>() && baseUrl != null) {
      inject(createDefaultDio());
    }
    return GetIt.I<NetworkService>();
  }

  static void inject(Dio dio) {
    GetIt.I.registerSingleton<NetworkService>(DioNetworkService(dio));
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
