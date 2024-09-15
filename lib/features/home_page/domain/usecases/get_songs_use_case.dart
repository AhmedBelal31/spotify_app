import 'package:dartz/dartz.dart';
import 'package:spotify_app/core/errors/failure.dart';
import 'package:spotify_app/features/home_page/domain/entities/songs_entity.dart';
import 'package:spotify_app/features/home_page/domain/repo/get_songs_repo.dart';

class GetSongsUseCase {
  GetSongsRepo getSongsRepo;

  GetSongsUseCase({required this.getSongsRepo});

  Future<Either<Failure, List<SongsEntity>>> call() async {
    return await getSongsRepo.getSongs();
  }
}
