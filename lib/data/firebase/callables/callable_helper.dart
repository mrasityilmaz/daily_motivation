part of 'firebase_callables.dart';

mixin _CallableHelper on Enum {
  HttpsCallable get callable {
    return functions.httpsCallable(name);
  }

  @protected
  FirebaseFunctions get functions => FirebaseFunctions.instance;
}
