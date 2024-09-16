import 'package:dartz/dartz.dart';
import 'package:houseplants/core/errors/failure.dart';
import 'package:houseplants/features/plants/data/model/plants.dart';

/// interface implement data layer of repository
///
abstract interface class PlantRepo {
  Future<Either<Failure, List<Plants>>> getAllPlants();
}
