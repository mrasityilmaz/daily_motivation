import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:quotely/domain/repositories/user_repository/data_sources/ilocal_repository.dart';

@immutable
@LazySingleton(as: UserLocalRepository)
final class UserHiveRepositoryImpl implements UserLocalRepository {
  ///
  /// If you want to use Hive, you can use this class.
  /// You can use this class to save data to the local database and etc.
  ///
}
