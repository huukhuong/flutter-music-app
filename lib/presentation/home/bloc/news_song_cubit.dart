import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify_clone/domain/usecases/song/get_new_songs.dart';
import 'package:spotify_clone/presentation/home/bloc/news_song_state.dart';
import 'package:spotify_clone/service_locator.dart';

class NewsSongCubit extends Cubit<NewsSongState> {
  NewsSongCubit() : super(NewsSongLoading());

  Future<void> getNewsSong() async {
    var data = await sl<GetNewSongsUsecase>().call();

    data.fold(
      (ifLeft) => emit(NewsSongLoadFailure()),
      (ifRight) => emit(NewsSongLoaded(songs: ifRight)),
    );
  }
}
