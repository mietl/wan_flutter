import 'dart:io';
import 'package:get/get.dart' hide Response;
import 'package:wan_flutter/common/models/app/wan_response.dart';

import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:wan_flutter/common/utils/api_constant.dart';
import 'package:wan_flutter/pages/login/index.dart';

class UnauthorizedException implements Exception {
  final String message;
  UnauthorizedException(this.message);
}

class WanException implements Exception {
  final String message;
  WanException(this.message);
}

class WanHttpUtil {
  static const bool debugProxy = false;

  static final WanHttpUtil _instance = WanHttpUtil._internal();

  factory WanHttpUtil() => _instance;

  static late final Dio _dio;

  WanHttpUtil._internal() {
    _dio = Dio(BaseOptions(
        baseUrl: ApiConstant.baseUrl,
        responseType: ResponseType.json,
        connectTimeout: const Duration(seconds: 30),
        receiveTimeout: const Duration(seconds: 30)));

    if (debugProxy) {
      _dio.httpClientAdapter = IOHttpClientAdapter(createHttpClient: () {
        return HttpClient()
          ..findProxy = (uri) {
            return 'PROXY 192.168.102.125:2214';
          };
        // ..badCertificateCallback((X509Certificate cret,String host,int port)=>true);
      });
    }

    // 日志拦截
    _dio.interceptors
        .add(LogInterceptor(responseBody: true, requestBody: true));

    // _dio.interceptors.add(ErrorInterceptor());
  }

  Future<Response> _handleResponse<T>(
      Future<Response> Function() request) async {
    try {
      final response = await request();
      final wanResponse =
          ObjectResponse.fromJson(response.data, (json) => json);

      if (wanResponse.errorCode == 0) {
        return response;
      } else if (wanResponse.errorCode == -1000) {
        removeHeadersCookies();
        Get.to(() => const LoginPage());
        throw UnauthorizedException(wanResponse.errorMsg);
      } else {
        throw WanException(wanResponse.errorMsg);
      }
    } on DioException catch (_) {
      rethrow;
    }
  }

  Future<Response> get(String url,
      {Map<String, dynamic>? queryParameters}) async {
    return _handleResponse(
        () => _dio.get(url, queryParameters: queryParameters));
  }

  Future<Response> post(
    String url, {
    Map<String, dynamic>? queryParameters,
    Object? data,
  }) async {
    return _handleResponse(() => _dio.post(
          url,
          data: data,
          queryParameters: queryParameters,
        ));
  }

  static setHeadersCookies(List<String>? cookies) {
    _dio.options.headers[HttpHeaders.cookieHeader] = cookies;
  }

  static removeHeadersCookies() {
    _dio.options.headers.remove(HttpHeaders.cookieHeader);
  }
}

class ErrorInterceptor extends Interceptor {
  // https://github.com/cfug/dio/issues/1950
  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    var wanResponse = ObjectResponse.fromJson(response.data, (json) => json);

    switch (wanResponse.errorCode) {
      case 0:
        handler.next(response);
        break;
      case -1000:
        throw UnauthorizedException(wanResponse.errorMsg);
      default:
        throw WanException(wanResponse.errorMsg);
    }
  }
}
