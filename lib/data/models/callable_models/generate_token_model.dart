import 'package:dart_mappable/dart_mappable.dart';
import 'package:flutter/material.dart';

part 'generate_token_model.mapper.dart';

@immutable
@MappableClass()
final class GenerateTokenModel with GenerateTokenModelMappable {
  const GenerateTokenModel(this.deviceId);

  final String deviceId;
}
