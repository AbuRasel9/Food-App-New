abstract class SharePrefs{

  String? get token;
  void setToken({required String value});
  Future<void> clearAuthData();


}