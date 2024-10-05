part of 'auth_service.dart';

mixin _SignInHelper {
  final AuthRepository authRepository = locator<AuthRepository>();
  final UserRepository userRepository = locator<UserRepository>();

  final userSessionBoxService = locator<HiveService>().userSessionBoxService;

  /// - If the user has a session and is logged in, update the last login time
  /// - If the user has a session but is not logged in, sign in with the session token
  /// - If the user has no session but is logged in or has been created before, generate a token and sign in
  /// - If the user has no session and is not logged in and has not been created yet, return false
  /// - If an error occurs, return false
  Future<bool> signIn({required String deviceId}) async {
    try {
      // Has session and user is logged in
      if (userSessionBoxService.hasSession && FirebaseAuth.instance.currentUser != null) {
        userSessionBoxService.updateLastLoginTime();
        return true;
      }
      // Has session but user is not logged in
      else if (userSessionBoxService.hasSession) {
        final UserSessionModel userSession = userSessionBoxService.getUserSession!;

        await FirebaseAuth.instance.signInWithCustomToken(userSession.sessionToken!);

        return true;
      }
      // No session but user is logged in OR user has been created before
      else if (FirebaseAuth.instance.currentUser != null || await hasAlreadyUserSameUDID(deviceId: deviceId)) {
        return await authRepository.generateToken(generateTokenModel: GenerateTokenModel(deviceId)).then((token) {
          return token.fold(
            (l) => false,
            (r) async {
              await FirebaseAuth.instance.signInWithCustomToken(r);
              return true;
            },
          );
        });
      }
      // No session and user is not logged in and user is not created yet
      else {
        return false;
      }
    } catch (e, s) {
      debugPrint('AuthService.signIn: $e, $s');
      return false;
    }
  }

  /// Check if user has already been created with the same device ID
  Future<bool> hasAlreadyUserSameUDID({String? deviceId}) async {
    try {
      final deviceUDID = deviceId ?? await FlutterUdid.consistentUdid;
      final user = await userRepository.findUserByDeviceId(deviceId: deviceUDID);
      return user.isRight() && user.asRight().deviceId == deviceId;
    } catch (e) {
      debugPrint(e.toString());
      return false;
    }
  }
}
