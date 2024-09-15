import 'package:dartz/dartz.dart';
import 'package:houseplants/core/errors/failure.dart';
import 'package:houseplants/features/plants/data/model/plants.dart';

abstract interface class PlantRepo {
  Future<Either<Failure, List<Plants>>> getAllPlants();
}
