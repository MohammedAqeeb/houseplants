import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:houseplants/core/usecase/get_plants.dart';
import 'package:houseplants/features/deep_link/domain/usecase/deep_link_usecase.dart';

part 'deep_link_event.dart';
part 'deep_link_state.dart';

class DeepLinkBloc extends Bloc<DeepLinkEvent, DeepLinkState> {
  final DeepLinkUsecase _deepLinkUsecase;

  DeepLinkBloc({
    required DeepLinkUsecase deepLinkUsecase,
  })  : _deepLinkUsecase = deepLinkUsecase,
        super(DeepLinkInitial()) {
    on<GetDeepLink>((event, emit) async {
      emit(DeepLinkProductLoading());
      final productId = await _deepLinkUsecase.call(NoParams());

      productId.fold((error) => emit(DeepLinkProductError()), (productId) {
        emit(DeepLinkProductFoundSuccess(productId: productId));
      });
    });
  }
}
