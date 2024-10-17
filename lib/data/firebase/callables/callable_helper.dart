part of 'firebase_callables.dart';

mixin _CallableHelper<T extends Object> on Enum {
  Future<HttpsCallableResult<R?>> call<R>({required T parameters}) async {
    return functions.httpsCallable(name).call<R?>(parameters);
  }

  @protected
  FirebaseFunctions get functions => FirebaseFunctions.instance;
}
