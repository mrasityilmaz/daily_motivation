import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

sealed class Failure extends Equatable {
  const Failure([this.properties = const <dynamic>[]]);
  final List<Object?> properties;

  @override
  List<Object?> get props => properties;
}

// General failures
@immutable
final class NetworkFailure extends Failure {
  NetworkFailure() : super([]);
}

@immutable
final class ServerFailure extends Failure {
  ServerFailure({this.errorMessage}) : super([errorMessage]);
  final String? errorMessage;
}

@immutable
final class CacheFailure extends Failure {
  CacheFailure({this.errorMessage}) : super([errorMessage]);
  final String? errorMessage;
}

@immutable
final class UnExpectedFailure<T> extends Failure {
  UnExpectedFailure({this.errorMessage, this.data}) : super([errorMessage, data]);
  final String? errorMessage;
  final T? data;
}

@immutable
final class FirestoreException extends Failure implements Exception {
  FirestoreException({this.errorMessage}) : super([errorMessage]);
  final String? errorMessage;
}
