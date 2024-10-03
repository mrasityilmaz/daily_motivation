import 'package:bee_hive/bee_hive.dart';
import 'package:flutter/foundation.dart';
import 'package:quotely/core/constants/hive_constants.dart';
import 'package:quotely/data/models/user_session_model/user_session_model.dart';

@immutable
final class UserSessionBoxService extends HiveBoxService<UserSessionModel> {
  UserSessionBoxService() : super(boxName: HiveConstants.sessionBoxKey, fromJson: UserSessionModel.fromMap);
}
