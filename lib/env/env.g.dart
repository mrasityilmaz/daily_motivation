// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'env.dart';

// **************************************************************************
// EnviedGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
final class _Env {
  static const List<int> _enviedkeyapiKey = <int>[
    4209732486,
    3676056053,
    1403870538,
  ];

  static const List<int> _envieddataapiKey = <int>[
    4209732589,
    3676055952,
    1403870515,
  ];

  static final String apiKey = String.fromCharCodes(List<int>.generate(
    _envieddataapiKey.length,
    (int i) => i,
    growable: false,
  ).map((int i) => _envieddataapiKey[i] ^ _enviedkeyapiKey[i]));
}
