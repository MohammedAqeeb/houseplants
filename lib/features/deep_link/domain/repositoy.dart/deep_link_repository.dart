import 'package:dartz/dartz.dart';
import 'package:houseplants/core/errors/failure.dart';

abstract interface class DeepLinkRepository {
  Future<Either<Failure, int>> extractIdFromLink();
}
