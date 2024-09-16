part of 'home_cubit.dart';

@immutable
sealed class HomeStates {}

final class HomeInitialState extends HomeStates {}

final class GetSongsLoadingState extends HomeStates {}

final class GetSongsSuccessState extends HomeStates {
  final List<SongsEntity> songs;

  GetSongsSuccessState({required this.songs});
}

final class GetSongsFailureState extends HomeStates {
  final String failure;

  GetSongsFailureState({required this.failure});
}
