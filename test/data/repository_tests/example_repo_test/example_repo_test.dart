import 'package:daily_motivation/core/errors/errors.dart';
import 'package:daily_motivation/core/extensions/dartz_extension.dart';
import 'package:daily_motivation/data/models/quote_model/quote_model.dart';
import 'package:daily_motivation/domain/repositories/example_repository/i_example_repository.dart';
import 'package:daily_motivation/injection/injection_container.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

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
  await configureDependencies(defaultEnv: 'mock');

  ///
  /// Here is the repository definition.
  ///
  late IExampleRepository exampleRepository;
  setUp(() {
    exampleRepository = locator<IExampleRepository>();
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
