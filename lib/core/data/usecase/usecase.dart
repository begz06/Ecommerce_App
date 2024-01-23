import 'package:dartz/dartz.dart';
import 'package:ecommerce_app_with_tdd/core/data/errors/errors.dart';
// import 'package:equatable/equatable.dart';

abstract class UseCase<Type, Params> {
  Future<Either<Errors, Type>> call(Params params);
}

// class NoParams extends Equatable {
//   @override
//   List<Object?> get props => [];
// }

// abstract class StreamUseCase<Type, Params> {
//   Stream<Type> call(Params params);
// }
