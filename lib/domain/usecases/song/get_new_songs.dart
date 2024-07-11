import 'package:dartz/dartz.dart';
import 'package:spotify_clone/core/usecase/usecase.dart';
import 'package:spotify_clone/domain/repository/song_repository.dart';
import 'package:spotify_clone/service_locator.dart';

class GetNewSongsUsecase implements Usecase<Either, dynamic> {
  @override
  Future<Either> call({params}) async {
    return sl<SongRepository>().getNewsSongs();
  }
}
