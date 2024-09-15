part of 'fetched_plant_cubit.dart';

@immutable
sealed class UpdatePlantCubitState {}

final class FetchedPlantCubitInitial extends UpdatePlantCubitState {}

final class FetchedPlants extends UpdatePlantCubitState {
  final List<Plants> plants;

  FetchedPlants({required this.plants});
}
