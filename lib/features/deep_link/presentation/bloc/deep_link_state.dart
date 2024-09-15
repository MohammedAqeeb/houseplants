part of 'deep_link_bloc.dart';

@immutable
sealed class DeepLinkState {}

final class DeepLinkInitial extends DeepLinkState {}

final class DeepLinkProductFoundSuccess extends DeepLinkState {
  final int productId;

  DeepLinkProductFoundSuccess({required this.productId});
}

final class DeepLinkProductError extends DeepLinkState {}

final class DeepLinkProductLoading extends DeepLinkState {}
