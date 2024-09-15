import 'package:spotify_app/features/home_page/domain/entities/songs_entity.dart';

class SongsModel extends SongsEntity {
  SongsModel({
    required super.artist,
    required super.title,
    required super.releaseDate,
    required super.duration,
  });

  factory SongsModel.fromJson(Map<String, dynamic> json) {
    return SongsModel(
      artist: json['artist'],
      title: json['title'],
      releaseDate: json['releaseDate'],
      duration: json['duration'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'artist': artist,
      'title': title,
      'releaseDate': releaseDate,
      'duration': duration,
    };
  }
}
