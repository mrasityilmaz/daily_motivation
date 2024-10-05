abstract class AuthLocalRepository {
  void saveToken({required String token, required String deviceId});
  void deleteToken();
}
