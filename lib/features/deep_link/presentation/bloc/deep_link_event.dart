part of 'deep_link_bloc.dart';

@immutable
sealed class DeepLinkEvent {}

class GetDeepLink extends DeepLinkEvent {}
