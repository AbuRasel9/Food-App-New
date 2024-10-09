import 'dart:convert';

import 'package:foodly_ui/lib/core/dataModel/auth/login_request.dart';
import 'package:foodly_ui/lib/core/dataModel/auth/login_response.dart';
import 'package:foodly_ui/lib/core/network/api_client.dart';
import 'package:foodly_ui/lib/utils/api_consts.dart';

import '../../service/service_locator.dart';
part 'auth_repo_impl.dart';
abstract class AuthRepo {

  final authService =di.get<ApiClient>();
  Future<LoginResponse>fetchLogin({required LoginRequest loginRequest});

}