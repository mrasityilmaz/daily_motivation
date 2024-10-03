import 'package:cloud_functions/cloud_functions.dart';
import 'package:flutter/foundation.dart';

part 'callable_helper.dart';

enum FirebaseCallables with _CallableHelper { generateCustomToken, validateToken }
