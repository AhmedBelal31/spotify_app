part of 'home_cubit.dart';

@immutable
sealed class HomeStates {}

final class HomeInitialState extends HomeStates {}

//Get Songs
final class GetSongsLoadingState extends HomeStates {}

final class GetSongsSuccessState extends HomeStates {
  final List<SongsEntity> songs;

  GetSongsSuccessState({required this.songs});
}

final class GetSongsFailureState extends HomeStates {
  final String failure;

  GetSongsFailureState({required this.failure});
}

/// Get Play List
final class GetPlayListLoadingState extends HomeStates {}

final class GetPlayListSuccessState extends HomeStates {
  final List<SongsEntity> songs;

  GetPlayListSuccessState({required this.songs});
}

final class GetPlayListFailureState extends HomeStates {
  final String failure;

  GetPlayListFailureState({required this.failure});
}
