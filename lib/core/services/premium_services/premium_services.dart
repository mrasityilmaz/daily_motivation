import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:stacked/stacked.dart';

@immutable
@lazySingleton
final class PremiumServices with ListenableServiceMixin {
  PremiumServices() {
    listenToReactiveValues([_isPremiumReactive]);
  }
  final ReactiveValue<bool> _isPremiumReactive = ReactiveValue<bool>(false);

  bool get isPremium => _isPremiumReactive.value;
}
