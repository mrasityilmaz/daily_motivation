import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:quotely/data/models/firestore_models/user_model/user_model.dart';
import 'package:quotely/data/services/hive_service/boxes/user_box.dart';
import 'package:quotely/data/services/hive_service/hive_service.dart';
import 'package:quotely/domain/repositories/user_repository/i_user_repository.dart';
import 'package:quotely/injection/injection_container.dart';
import 'package:stacked/stacked.dart';

@immutable
@Singleton(order: 3)
final class UserService {
  UserRepository get _userRepository => locator<UserRepository>();
  UserBoxService get _userBoxService => locator<HiveService>().userBoxService;

  late final ReactiveValue<UserModel?> _user = ReactiveValue<UserModel?>(null);
  UserModel? get user => _user.value;

  @protected
  @PostConstruct(preResolve: true)
  Future<void> initUser() async {
    try {
      final UserModel? hasSigned =
          await _userRepository.signInAnonymously().then((value) => value.fold((l) => null, (r) => r));
      if (hasSigned != null) {
        _user.value = hasSigned;
      }
    } catch (e, s) {
      debugPrint('Error initializing user: $e, $s');
    }
  }
}
