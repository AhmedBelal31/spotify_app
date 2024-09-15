import 'package:cloud_firestore/cloud_firestore.dart';

class SongsEntity {
  final String artist;
  final String title;
  final Timestamp releaseDate;
  final num duration;

  const SongsEntity({
    required this.artist,
    required this.title,
    required this.releaseDate,
    required this.duration,
  });



}
