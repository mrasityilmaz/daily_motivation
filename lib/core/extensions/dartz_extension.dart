import 'package:dartz/dartz.dart' as dartz;
import 'package:quotely/core/errors/errors.dart';

// Thanks for @ramazanyigitt for this extension and the other many ideas and help
typedef EitherOr<T> = dartz.Either<CustomException, T>;
typedef Right<T> = dartz.Right<CustomException, T>;
typedef Left<T> = dartz.Left<CustomException, T>;
typedef TestRight<T> = dartz.Right<CustomException, T>;
typedef TestLeft<T> = dartz.Left<CustomException, T>;

extension EitherX<L, R> on dartz.Either<L, R> {
  R asRight() => (this as dartz.Right).value as R;
  L asLeft() => (this as dartz.Left).value as L;
}
