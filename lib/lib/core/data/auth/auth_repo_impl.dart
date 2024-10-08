part of 'auth_repo.dart';

class AuthRepoImpl extends AuthRepo {
  @override
  Future<LoginResponse> fetchLogin({required LoginRequest loginRequest}) async {
    try{
      final loginResponse=await authService.post(loginRequest.toJson());
      return loginResponseFromJson(loginResponse.data);


    }catch(e){
      throw Exception(e);

    }



  }
}
