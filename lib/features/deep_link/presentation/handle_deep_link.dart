import 'package:flutter/material.dart';
import 'package:houseplants/core/cubit/fetched_plant_cubit.dart';
import 'package:houseplants/core/usecase/get_plants.dart';
import 'package:houseplants/features/plants/presentation/pages/plants_detail_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:houseplants/core/helper/navigate.dart';

import '../domain/usecase/deep_link_usecase.dart';
import 'pages/not_found.dart';

class HandleDeepLinkUsecase {
  final DeepLinkUsecase deepLinkUsecase;
  final FetchedPlantsCubit fetchedPlantsCubit;

  HandleDeepLinkUsecase({
    required this.deepLinkUsecase,
    required this.fetchedPlantsCubit,
  });

  Future<void> call(BuildContext context) async {
    final productIdEither = await deepLinkUsecase.call(NoParams());

    productIdEither.fold(
      (error) {
        navigatePush(context, () => const NotFoundScreen());
      },
      (productId) {
        final getAllPlantsState = context.read<FetchedPlantsCubit>().state;

        if (getAllPlantsState is FetchedPlants) {
          final plants = getAllPlantsState.plants;

          try {
            final plant = plants.firstWhere((plant) => plant.id == productId);

            // Navigate to the details page if the plant is found

            navigatePush(
              context,
              () => PlantsDetailScreen(allPlants: plant),
            );
          } catch (e) {
            // If the plant is not found, navigate to the NotFoundScreen
            navigatePush(context, () => const NotFoundScreen());
          }
        } else {
          //  plants are not yet loaded
          navigatePush(context, () => const NotFoundScreen());
        }
      },
    );
  }
}
