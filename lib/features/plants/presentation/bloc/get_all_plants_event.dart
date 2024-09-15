part of 'get_all_plants_bloc.dart';

@immutable
sealed class GetAllPlantsEvent {}


class FetchPlantsEvent extends GetAllPlantsEvent {}