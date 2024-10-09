part of 'auth_repo.dart';

class AuthRepoImpl extends AuthRepo {
  @override
  Future<LoginResponse> fetchLogin({required LoginRequest loginRequest}) async {
    try {
      final loginResponse = await authService.post( request:loginRequest.toJson(), apiEndPoint: AppApiConstants.loginUrl);

      if (loginResponse.statusCode == 200) {
        return LoginResponse.fromJson(loginResponse.data);
      } else {
        throw Exception("Api call failed");
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
