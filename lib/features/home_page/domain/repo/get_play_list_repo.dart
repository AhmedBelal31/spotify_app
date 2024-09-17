import 'package:dartz/dartz.dart';
import 'package:spotify_app/core/errors/failure.dart';
import 'package:spotify_app/features/home_page/domain/entities/songs_entity.dart';

abstract class GetPlayListRepo {
  Future<Either<Failure, List<SongsEntity>>> getPlayList();
}
