import 'dart:convert';
import 'package:foodly_ui/lib/core/dataModel/auth/login_request.dart';
import 'package:foodly_ui/lib/core/dataModel/auth/login_response.dart';
import 'package:dio/dio.dart';
import 'package:foodly_ui/lib/utils/api_consts.dart';
import 'package:http/http.dart'as http;

class ApiClient {
  final String? baseUrl;

  ApiClient([this.baseUrl]);

  final Dio _dio = Dio();

  //login api call
  Future<Response> post(Map<String,dynamic> request) async {
    try{

      Response response = await _dio.post(
          AppApiConstants.baseUrl + AppApiConstants.loginUrl,
          options: Options(
              headers:{
                "Content-Type":"Application/json",
                "Accept":"Application/json",

              }

          ),
          data: request,
      );
      if(response.statusCode==200){
        return response.data ;
      }else{
        throw Exception("Api call error ${response.statusCode}");
      }

    }catch(e){
      throw Exception("Api call error ${e}");


    }
  }

  Future<Map<String, dynamic>> get(
      {String? customBaseUrl,
      required String endpoint,
      Map<String, String>? headers}) async {
    final response = await http.get(
      Uri.parse('${customBaseUrl ?? baseUrl}$endpoint'),
      headers: headers ?? {'Content-Type': 'application/json'},
    );
    return _processResponse(response);
  }



  Future<Map<String, dynamic>> put(
      {String? customBaseUrl,
      required String endpoint,
      Map<String, String>? headers,
      dynamic body}) async {
    final response = await http.put(
      Uri.parse('${customBaseUrl ?? baseUrl}$endpoint'),
      headers: headers ?? {'Content-Type': 'application/json'},
      body: json.encode(body),
    );
    return _processResponse(response);
  }

  Future<Map<String, dynamic>> delete(
      {String? customBaseUrl,
      required String endpoint,
      Map<String, String>? headers}) async {
    final response = await http.delete(
        Uri.parse('${customBaseUrl ?? baseUrl}$endpoint'),
        headers: headers);
    return _processResponse(response);
  }

  Future<Map<String, dynamic>> _processResponse(http.Response response) async {
    if (response.statusCode >= 200 && response.statusCode < 300) {
      return json.decode(response.body);
    } else {
      throw Exception('Error: ${response.statusCode} - ${response.body}');
    }
  }
}
