import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:houseplants/core/usecase/get_plants.dart';
import 'package:houseplants/features/plants/data/model/plants.dart';

import '../../domain/useCase/get_all_plants.dart';

part 'get_all_plants_event.dart';
part 'get_all_plants_state.dart';

class GetAllPlantsBloc extends Bloc<GetAllPlantsEvent, GetAllPlantsState> {
  final GetAllPlantsUseCase _allPlantsUseCase;

  GetAllPlantsBloc({
    required GetAllPlantsUseCase getAllPlantsUseCase,
  })  : _allPlantsUseCase = getAllPlantsUseCase,
        super(GetAllPlantsInitial()) {
    on<FetchPlantsEvent>((event, emit) async {
      emit(GetAllPlantsLoading());
      final fetchPlants = await _allPlantsUseCase.call(NoParams());

      fetchPlants.fold((l) => emit(GetAllPlantsFailure(message: l.message)),
          (fetchData) {
        emit(GetAllPlantsSuccess(plants: fetchData));
      });
    });
  }
}
