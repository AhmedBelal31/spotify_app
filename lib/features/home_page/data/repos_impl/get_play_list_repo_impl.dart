import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:spotify_app/core/errors/failure.dart';
import 'package:spotify_app/features/home_page/data/models/song_model.dart';
import 'package:spotify_app/features/home_page/domain/entities/songs_entity.dart';
import 'package:spotify_app/features/home_page/domain/repo/get_play_list_repo.dart';
import '../../../../core/consts/database_end_points.dart';

class GetPlayListRepoImpl implements GetPlayListRepo {
  FirebaseFirestore fireStore = FirebaseFirestore.instance;

  @override
  Future<Either<Failure, List<SongsEntity>>> getPlayList() async {
    List<SongsEntity> songs = [];
    try {
      var result = await fireStore
          .collection(songsCollection)
          .orderBy("releaseDate", descending: true)
          .get();
      for (var song in result.docs) {
        songs.add(SongsModel.fromJson(song.data()));
      }
      return right(songs);
    } catch (e) {
      log("Error on GetSongsPlayListImpl getSongs: $e");
      return left(ServerFailure(e.toString()));
    }
  }
}
