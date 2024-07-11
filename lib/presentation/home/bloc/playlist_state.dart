import 'package:spotify_clone/domain/entities/song/song.dart';

abstract class PlaylistState {}

class PlaylistLoading extends PlaylistState {}

class PlaylistLoaded extends PlaylistState {
  final List<SongModel> playlist;

  PlaylistLoaded({required this.playlist});
}

class PlaylistLoadFailure extends PlaylistState {}
