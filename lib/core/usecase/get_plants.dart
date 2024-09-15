import 'package:dartz/dartz.dart';
import 'package:houseplants/core/errors/failure.dart';

abstract interface class GetPlantsUseCase<Type, NoParams> {
  Future<Either<Failure, Type>> call(NoParams noparams);
}

class NoParams {}
