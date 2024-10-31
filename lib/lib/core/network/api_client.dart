// import 'dart:convert';
// import 'package:foodly_ui/lib/core/data/sharePrefs/share_prefs.dart';
// import 'package:foodly_ui/lib/core/dataModel/auth/login_request.dart';
// import 'package:foodly_ui/lib/core/dataModel/auth/login_response.dart';
// import 'package:dio/dio.dart';
// import 'package:foodly_ui/lib/utils/api_consts.dart';
// import 'package:http/http.dart' as http;
//
// import '../service/service_locator.dart';
//
// class ApiClient {
//   final sharePrefsDi = di.get<SharePrefs>();
//   Dio _dio = Dio();
//
//
//   ApiClient()
//       : _dio = Dio(BaseOptions(
//     headers: {
//   "Content-Type": "Application/json",
//   "Accept": "Application/json",
//   },
//     baseUrl: AppApiConstants.baseUrl,
//     connectTimeout: const Duration(
//       minutes: 5,
//     ),
//     receiveTimeout: const Duration(
//       minutes: 5,
//     ),
//   ));
//
//   //post api call
//   Future<Response> post(
//       {required String apiEndPoint, required Map<String, dynamic> request, Map<
//           String,
//           dynamic>? queryParameters,
//         Options? options,
//         CancelToken? cancelToken,
//         ProgressCallback? onSendProgress,
//         ProgressCallback? onReceiveProgress,}) async {
//     print(
//         "---------------api ${AppApiConstants.baseUrl +
//             AppApiConstants.loginUrl}");
//
//     try {
//       Response response = await _dio.post(
//         apiEndPoint,
//         data: request,
//         queryParameters: queryParameters,
//         options: options,
//         cancelToken: cancelToken,
//         onSendProgress: onSendProgress,
//         onReceiveProgress: onReceiveProgress,
//       );
//       print("---------------response ${response.data}");
//       return response;
//     } catch (e) {
//       throw Exception("Api call error ---${e}");
//     }
//   }
//
//   //post api call
//   Future<Response> get({required String apiEndPoint,
//     Map<String,dynamic>  ? queryParameters,
//     Options? options,
//     CancelToken? cancelToken,
//     ProgressCallback? onSendProgress,
//     ProgressCallback? onReceiveProgress,}) async {
//     print(
//         "---------------api ${AppApiConstants.baseUrl +
//             AppApiConstants.loginUrl}");
//
//     try {
//       Response response = await _dio.get(
//         apiEndPoint,
//         queryParameters: queryParameters,
//         options: options,
//         cancelToken: cancelToken,
//
//         onReceiveProgress: onReceiveProgress,
//       );
//       print("---------------response ${response.data}");
//       return response;
//     } catch (e) {
//       throw Exception("Api call error ---${e}");
//     }
//   }
// }
import 'dart:convert';
import 'dart:developer';
import 'package:foodly_ui/lib/core/data/sharePrefs/share_prefs.dart';
import 'package:foodly_ui/lib/core/dataModel/auth/login_request.dart';
import 'package:foodly_ui/lib/core/dataModel/auth/login_response.dart';
import 'package:dio/dio.dart';
import 'package:foodly_ui/lib/core/network/custom_log_intercepter.dart';
import 'package:foodly_ui/lib/utils/api_consts.dart';
import '../service/service_locator.dart';

class ApiClient {
  final sharePrefsDi = di.get<SharePrefs>();
  late Dio _dio;

  ApiClient() {
    _dio = Dio(BaseOptions(
      headers: {
        "Content-Type": "Application/json",
        "Accept": "Application/json",
      },
      baseUrl: AppApiConstants.baseUrl,
      connectTimeout: const Duration(minutes: 5),
      receiveTimeout: const Duration(minutes: 5),
    ));

    // Add interceptors for logging
    _dio.interceptors.add(CustomLogInterceptor(),);
  }

  // POST API call
  Future<Response> post({
    required String apiEndPoint,
    required Map<String, dynamic> request,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      Response response = await _dio.post(
        apiEndPoint,
        data: request,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } catch (e) {
      throw Exception(" API call error: $e");
    }
  }

  // GET API call
  Future<Response> get({
    required String apiEndPoint,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      Response response = await _dio.get(

        apiEndPoint,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } catch (e) {
      throw Exception("API call error: $e");
    }
  }





  ///Put Method
  Future<Map<String, dynamic>> put(
      String path, {
        data,
        Map<String, dynamic>? queryParameters,
        Options? options,
        CancelToken? cancelToken,
        ProgressCallback? onSendProgress,
        ProgressCallback? onReceiveProgress
      }) async{
    try{
      final Response response = await _dio.put(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      if(response.statusCode == 200){
        return response.data;
      }
      throw "something went wrong";
    } catch (e){
      rethrow;
    }
  }



  ///Delete Method
  Future<dynamic> delete(
      String path, {
        data,
        Map<String, dynamic>? queryParameters,
        Options? options,
        CancelToken? cancelToken,
        ProgressCallback? onSendProgress,
        ProgressCallback? onReceiveProgress
      }) async{
    try{
      final Response response = await _dio.delete(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,

      );
      if(response.statusCode == 204){
        return response.data;
      }
      throw "something went wrong";
    } catch (e){
      rethrow;
    }
  }
}
