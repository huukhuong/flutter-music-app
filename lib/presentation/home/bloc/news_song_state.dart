import 'package:spotify_clone/domain/entities/song/song.dart';

abstract class NewsSongState {}

class NewsSongLoading extends NewsSongState {}

class NewsSongLoaded extends NewsSongState {
  final List<SongModel> songs;

  NewsSongLoaded({required this.songs});
}

class NewsSongLoadFailure extends NewsSongState {}
