// ignore_for_file: unused_element

part of 'user_service.dart';

abstract class _IUserService with LoggerHelper {
  UserRepository get _userRepository;
  UserBoxService get _userBoxService;

  /// Reactive value for the user
  /// This value will be updated when the user is updated
  /// Also, all listeners will be notified when the user is updated
  late final ReactiveValue<UserModel?> _user = ReactiveValue<UserModel?>(null);

  set user(UserModel? value);
  UserModel? get user;

  /// {@macro UserRemoteRepository}
  Future<void> initUser();

  /// This function will get the signed user account
  /// If the user is not signed in, it will return
  /// If the user is signed in and the user is not created, it will create the user
  /// If the user is signed in and the user is created, it will get the user
  Future<void> getSignedUserAccount();

  /// {@template UserService.updateUser}
  /// This function will update the user on Firestore
  ///
  /// Then, it will update [_user] value
  /// also, it will update the user in the local storage
  ///
  /// #### That must be a private function and should not be called from outside
  ///
  /// #### Because it's very high-level function
  ///
  /// Add your own update functions every single part of [UserModel]
  /// {@endtemplate}
  @protected
  Future<void> _updateUser(UserModel userModel);

  /// {@template UserService.setUserRequiredFields}
  /// This function required to update the user
  /// - timezone,
  /// - device token,
  /// - notification permission,
  /// - and other required fields
  ///
  /// #### UserModel.deviceToken
  /// {@macro UserModel.deviceToken}
  /// #### UserModel.sendNotifications
  /// {@macro UserModel.sendNotifications}
  ///
  /// It's important to update these fields to provide a better user experience
  /// It's required to call this function after the app is initialized and the user is signed in
  /// {@endtemplate}
  Future<void> setUserRequiredFields();

  /// {@template UserService.userHasSignUpWithEmail}
  /// Checks the provider data of the user
  /// This function will check if the user has signed up with email
  /// If the user has signed up with email, it will return true
  /// Otherwise, it will return false
  /// {@endtemplate}
  bool get userHasSignUpWithEmail;

  /// {@template UserService.sendEmailVerification}
  /// This function will send an email verification to the user
  /// If the user has signed up with email and the email is not verified
  /// It will send an email verification to the user
  /// Be careful, the user's requests will be blocked if you send too many requests
  /// {@endtemplate}
  Future<void> sendEmailVerification();
}
