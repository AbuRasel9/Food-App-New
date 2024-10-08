import 'package:flutter/cupertino.dart';
import 'package:foodly_ui/lib/core/data/auth/auth_repo.dart';
import 'package:foodly_ui/lib/core/data/sharePrefs/share_prefs.dart';
import 'package:foodly_ui/lib/core/data/sharePrefs/share_prefs_impl.dart';
import 'package:foodly_ui/lib/core/dataModel/auth/login_response.dart';

import '../dataModel/auth/login_request.dart';
import '../service/service_locator.dart';

class AuthProvider extends ChangeNotifier {
   final sharePrefsService=di.get<SharePrefs>();
  //<<-------------->> variable <<-------------->>//

  LoginResponse? _loginResponse;
  bool _isLoading=false;
  //<<-------------->> get data <<-------------->>//

  bool get isLoading=>_isLoading;

  LoginResponse? get getLoginResponse => _loginResponse;
  //<<-------------->> function <<-------------->>//
   void setLoading({required bool value}){
     _isLoading=value;
     notifyListeners();

   }


  Future<LoginResponse> getLogin({required LoginRequest request}) async {
    final result=await AuthRepoImpl().fetchLogin(
      loginRequest: request,

    );
    return result;
    sharePrefsService.setToken(value: result.token ?? "");
    _loginResponse =result;
        notifyListeners();
  }

}
