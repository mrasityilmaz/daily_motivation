import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:injectable/injectable.dart' show Environment;
import 'package:quotely/core/errors/errors.dart';
import 'package:quotely/core/extensions/dartz_extension.dart';
import 'package:quotely/data/models/quote_model/quote_model.dart';
import 'package:quotely/domain/repositories/user_repository/i_user_repository.dart';
import 'package:quotely/injection/injection_container.dart';

void main() async {
  ///
  /// That part is unnecessary for testing but this way provides you to test your repository with your mock or real data.
  ///

  WidgetsFlutterBinding.ensureInitialized();

  ///
  /// Dependency Injection Configuration for Mock Data
  /// You can change the default environment from here.
  ///
  ///
  configureDependencies(defaultEnv: Environment.test);

  ///
  /// Here is the repository definition.
  ///
  late IUserRepository exampleRepository;
  setUp(() {
    exampleRepository = locator<IUserRepository>();
  });

  group('Example Repository Successfuly Fetch Tests', () {
    test('getSomeData Test', () async {
      final result = await exampleRepository.getSomeData();

      expect(result, isA<Right<Failure, QuoteModel>>());
      expect(result.asRight(), isA<QuoteModel>());
    });

    test('getSomeListData Successfuly Fetch Test', () async {
      final result = await exampleRepository.getSomeListData();

      expect(result, isA<Right<Failure, List<QuoteModel>>>());
      expect(result.asRight(), isA<List<QuoteModel>>());
    });
  });
}
