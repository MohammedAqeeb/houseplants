import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:houseplants/features/plants/data/model/plants.dart';

part 'fetched_plant_cubit_state.dart';

class FetchedPlantsCubit extends Cubit<UpdatePlantCubitState> {
  FetchedPlantsCubit() : super(FetchedPlantCubitInitial());

  void fetchedPlants(List<Plants>? plants) {
    if (plants == null) {
      emit(FetchedPlantCubitInitial());
    } else {
      emit(FetchedPlants(plants: plants));
    }
  }
}
