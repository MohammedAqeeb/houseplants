import 'package:dartz/dartz.dart';
import 'package:houseplants/core/errors/failure.dart';
import 'package:houseplants/core/usecase/get_plants.dart';

import '../repositoy.dart/deep_link_repository.dart';

class DeepLinkUsecase implements GetPlantsUseCase<int, NoParams> {
  final DeepLinkRepository deepLinkRepository;

  DeepLinkUsecase({
    required this.deepLinkRepository,
  });

  @override
  Future<Either<Failure, int>> call(NoParams noparams) async {
    return await deepLinkRepository.extractIdFromLink();
  }
}
