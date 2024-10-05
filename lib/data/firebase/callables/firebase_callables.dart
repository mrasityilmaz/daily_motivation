import 'package:cloud_functions/cloud_functions.dart';
import 'package:flutter/foundation.dart';
import 'package:quotely/data/models/callable_models/generate_token_model.dart';

part 'callable_helper.dart';

enum FirebaseCallables<T extends Object> with _CallableHelper<T> {
  generateCustomToken<GenerateTokenModel>(),
  validateToken;

  const FirebaseCallables();
}
