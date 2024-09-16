import 'package:get_it/get_it.dart';

import 'package:houseplants/features/plants/data/data_source/get_plants.dart';
import 'package:houseplants/features/plants/data/repository/plant_repo_impl.dart';
import 'package:houseplants/features/plants/domain/repository/plant_repo.dart';
import 'package:houseplants/features/plants/domain/useCase/get_all_plants.dart';
import 'package:houseplants/features/plants/presentation/bloc/get_all_plants_bloc.dart';

import 'features/deep_link/data_source/fetch_data.dart';
import 'features/deep_link/logic/handle_deeplink.dart';

final serviceLocator = GetIt.instance;

void initialization() {
  // ------- Gets Plants From Api Dependecy ------
  // Data Source
  serviceLocator
    ..registerLazySingleton<GetAllPlantsDataSource>(
      () => GetAllPlantsDataSourceImp(),
    )
    // // Repository instance
    ..registerLazySingleton<PlantRepo>(
      () => PlantRepoImpl(
        getAllPlantsDataSource: serviceLocator(),
      ),
    )
    // UseCase
    ..registerLazySingleton(
      () => GetAllPlantsUseCase(
        plantRepo: serviceLocator(),
      ),
    )
    // Bloc
    ..registerLazySingleton<GetAllPlantsBloc>(
      () => GetAllPlantsBloc(
        getAllPlantsUseCase: serviceLocator(),
      ),
    )

    // ------- DeepLink Dependency ------

    ..registerLazySingleton(
      () => GetPlants(),
    )
    ..registerLazySingleton<HandleDeeplink>(
      () => HandleDeeplink(
        getAllPlantsDataSource: serviceLocator(),
      ),
    );
}
