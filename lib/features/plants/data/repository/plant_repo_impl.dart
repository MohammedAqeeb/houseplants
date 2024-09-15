import 'package:dartz/dartz.dart';
import 'package:houseplants/core/errors/exception.dart';
import 'package:houseplants/core/errors/failure.dart';
import 'package:houseplants/features/plants/data/data_source/get_plants.dart';
import 'package:houseplants/features/plants/data/model/plants.dart';
import 'package:houseplants/features/plants/domain/repository/plant_repo.dart';

class PlantRepoImpl implements PlantRepo {
  final GetAllPlantsDataSource getAllPlantsDataSource;

  PlantRepoImpl({required this.getAllPlantsDataSource});

  @override
  Future<Either<Failure, List<Plants>>> getAllPlants() async {
    try {
      final response = await getAllPlantsDataSource.getAllPlants();

      return Right(response);
    } on ServerException catch (e) {
      return Left(Failure(e.toString()));
    }
  }
}
