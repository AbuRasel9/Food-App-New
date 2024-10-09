// lib/core/interceptors/logging_interceptor.dart
import 'dart:developer';
import 'package:dio/dio.dart';

class CustomLogInterceptor extends InterceptorsWrapper {
  //<<-------------->> request data print <<-------------->>//
  
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    log('✅ Url: ${options.baseUrl}${options.path}\n \t  ➡️ Request:${options.data}');
    super.onRequest(options, handler); // Continue with the request
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    log('✅ status code:${response.statusCode}\n \t  ➡️ Data: ${response.data}');
    super.onResponse(response, handler); // Continue with the response
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    log("❌ Error occurred: ${err.response?.statusCode} ${err.message}");
    if (err.response != null) {
      log("❌ Error response data: ${err.response?.data}");
    }
    super.onError(err, handler); // Continue with the error
  }
}
