import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';
import 'package:spotify_app/features/home_page/domain/usecases/get_songs_use_case.dart';

import '../../../../../core/errors/failure.dart';
import '../../../domain/entities/songs_entity.dart';

part 'home_states.dart';

class HomeCubit extends Cubit<HomeStates> {
  GetSongsUseCase getSongsUseCase;

  HomeCubit({required this.getSongsUseCase}) : super(HomeInitialState());

  Future<void> getSongs() async {
    emit(GetSongsLoadingState());
    Either<Failure, List<SongsEntity>> eitherFailureOrSongs =
        await getSongsUseCase.call();
    eitherFailureOrSongs.fold((failure) {
      emit(GetSongsFailureState(failure: failure.message));
    }, (songs) {
      emit(GetSongsSuccessState(songs: songs));
    });
  }
}
