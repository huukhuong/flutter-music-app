import 'package:dartz/dartz.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:spotify_clone/domain/entities/song/song.dart';

abstract class SongFirebaseService {
  Future<Either> getNewsSongs();
  Future<Either> getPlaylist();
}

class SongFirebaseServiceImpl implements SongFirebaseService {
  @override
  Future<Either> getNewsSongs() async {
    List<SongModel>? songs = [];

    try {
      var data = await FirebaseDatabase.instance.ref("songs").get();

      if (data.exists) {
        List<dynamic> songsList = data.value as List<dynamic>;
        songs = songsList
            .map(
                (value) => SongModel.fromJson(Map<String, dynamic>.from(value)))
            .toList();
      }

      return Right(songs);
    } catch (e) {
      return const Right([]);
    }
  }

  @override
  Future<Either> getPlaylist() async {
    List<SongModel>? songs = [];

    try {
      var data = await FirebaseDatabase.instance.ref("songs").get();

      if (data.exists) {
        List<dynamic> songsList = data.value as List<dynamic>;
        songs = songsList
            .map(
                (value) => SongModel.fromJson(Map<String, dynamic>.from(value)))
            .toList();
      }

      return Right(songs);
    } catch (e) {
      return const Right([]);
    }
  }
}
