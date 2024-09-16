import 'package:dartz/dartz.dart';
import 'package:houseplants/core/errors/failure.dart';
import 'package:houseplants/core/usecase/get_plants.dart';
import 'package:houseplants/features/plants/data/model/plants.dart';
import 'package:houseplants/features/plants/domain/repository/plant_repo.dart';

class GetAllPlantsUseCase implements GetPlantsUseCase<List<Plants>, NoParams> {
  final PlantRepo plantRepo;

  GetAllPlantsUseCase({required this.plantRepo});

  /// Function call interface of domain layer that has implemented the plantRepo
  ///
  @override
  Future<Either<Failure, List<Plants>>> call(NoParams noparams) async {
    return await plantRepo.getAllPlants();
  }
}
