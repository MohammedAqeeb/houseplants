import 'package:get_it/get_it.dart';
import 'package:houseplants/features/deep_link/data/data_source/data_source.dart';
import 'package:houseplants/features/deep_link/data/repository/deep_link_repo_imp.dart';
import 'package:houseplants/features/deep_link/domain/repositoy.dart/deep_link_repository.dart';
import 'package:houseplants/features/deep_link/domain/usecase/deep_link_usecase.dart';
import 'package:houseplants/features/deep_link/presentation/bloc/deep_link_bloc.dart';
import 'package:houseplants/features/plants/data/data_source/get_plants.dart';
import 'package:houseplants/features/plants/data/repository/plant_repo_impl.dart';
import 'package:houseplants/features/plants/domain/repository/plant_repo.dart';
import 'package:houseplants/features/plants/domain/useCase/get_all_plants.dart';
import 'package:houseplants/features/plants/presentation/bloc/get_all_plants_bloc.dart';

import 'core/cubit/fetched_plant_cubit.dart';
import 'features/deep_link/presentation/handle_deep_link.dart';

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
        fetchedPlants: serviceLocator(),
      ),
    )

    // ------- DeepLink Dependency ------

    ..registerLazySingleton(
      () => FetchedPlantsCubit(),
    )

    // Data Source
    ..registerLazySingleton<DeepLinkDataSource>(
      () => DeepLinkDataSourceImpl(),
    )
    // Repository instance
    ..registerLazySingleton<DeepLinkRepository>(
      () => DeepLinkRepoImp(
        dataSource: serviceLocator(),
      ),
    )
    // UseCase
    ..registerLazySingleton(
      () => DeepLinkUsecase(
        deepLinkRepository: serviceLocator(),
      ),
    )
    // Bloc
    ..registerLazySingleton<DeepLinkBloc>(
      () => DeepLinkBloc(
        deepLinkUsecase: serviceLocator(),
      ),
    )
    ..registerLazySingleton<HandleDeepLinkUsecase>(
      () => HandleDeepLinkUsecase(
        deepLinkUsecase: serviceLocator(),
        fetchedPlantsCubit: serviceLocator(),
      ),
    );
}
