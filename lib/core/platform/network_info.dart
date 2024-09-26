import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

abstract base class NetworkInfo {
  Future<bool> get isConnected;

  void onInternetChange({
    AsyncCallback? onConnect,
    AsyncCallback? onDisconnect,
  });
}

@immutable
@LazySingleton(as: NetworkInfo)
final class NetworkInfoImpl implements NetworkInfo {
  InternetConnectionChecker get connectionChecker => InternetConnectionChecker();

  @override
  Future<bool> get isConnected => connectionChecker.hasConnection;

  @override
  void onInternetChange({
    AsyncCallback? onConnect,
    AsyncCallback? onDisconnect,
  }) {
    connectionChecker.onStatusChange.listen((status) async {
      return switch (status) {
        InternetConnectionStatus.connected => await onConnect?.call(),
        InternetConnectionStatus.disconnected => await onDisconnect?.call()
      };
    });
  }
}
