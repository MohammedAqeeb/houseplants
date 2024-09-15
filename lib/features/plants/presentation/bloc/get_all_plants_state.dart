part of 'get_all_plants_bloc.dart';

@immutable
sealed class GetAllPlantsState {}

final class GetAllPlantsInitial extends GetAllPlantsState {}

final class GetAllPlantsLoading extends GetAllPlantsState {}

final class GetAllPlantsSuccess extends GetAllPlantsState {
  final List<Plants> plants;

  GetAllPlantsSuccess({required this.plants});
}

final class GetAllPlantsFailure extends GetAllPlantsState {
  final String message;

  GetAllPlantsFailure({required this.message});
}
