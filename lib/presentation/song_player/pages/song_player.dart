import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify_clone/common/helpers/is_dark.dart';
import 'package:spotify_clone/common/helpers/utils.dart';
import 'package:spotify_clone/common/widgets/app_bar/app_bar.dart';
import 'package:spotify_clone/core/config/theme/app_colors.dart';
import 'package:spotify_clone/domain/entities/song/song.dart';
import 'package:spotify_clone/presentation/song_player/bloc/song_player_cubit.dart';
import 'package:spotify_clone/presentation/song_player/bloc/song_player_state.dart';

class SongPlayerPage extends StatelessWidget {
  final SongModel song;

  const SongPlayerPage({super.key, required this.song});

  Widget _renderThumbnail() {
    return Center(
      child: Container(
        height: 400,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          image: DecorationImage(
            image: NetworkImage(
              getImageUrlFromFileName(song.fileName),
            ),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  Widget _renderSongInfo(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "${song.title}",
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            Text(
              "${song.artist}",
              style: const TextStyle(
                fontSize: 16,
              ),
            ),
          ],
        ),
        Icon(
          Icons.favorite_outline,
          color: context.isDarkMode ? AppColors.grey : AppColors.darkGrey,
        ),
      ],
    );
  }

  Widget _renderPlayerControl() {
    return BlocBuilder<SongPlayerCubit, SongPlayerstate>(
      builder: (context, state) {
        if (state is SongPlayerLoading) {
          return Container(
            alignment: Alignment.center,
            child: const CircularProgressIndicator(
              color: AppColors.primary,
            ),
          );
        }

        if (state is SongPlayerLoaded) {
          var songPositon = context.read<SongPlayerCubit>().songPosition;
          var songDuration = context.read<SongPlayerCubit>().duration;

          return Column(
            children: [
              const SizedBox(height: 20),
              Slider(
                value: songPositon.inSeconds.toDouble(),
                min: 0,
                max: songDuration.inSeconds.toDouble(),
                onChanged: (value) {
                  context.read<SongPlayerCubit>().seekTo(value);
                },
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(formatDuration(songPositon)),
                  Text(formatDuration(songDuration)),
                ],
              ),
              const SizedBox(height: 10),
              SizedBox(
                width: 250,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(
                      Icons.loop,
                      color: context.isDarkMode
                          ? AppColors.grey
                          : AppColors.darkGrey,
                      size: 30,
                    ),
                    Icon(
                      Icons.skip_previous_rounded,
                      color: context.isDarkMode
                          ? AppColors.grey
                          : AppColors.darkGrey,
                      size: 30,
                    ),
                    GestureDetector(
                      onTap: () {
                        context.read<SongPlayerCubit>().playOrPauseSong();
                      },
                      child: Container(
                        width: 50,
                        height: 50,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.primary,
                        ),
                        child: Icon(
                          context.read<SongPlayerCubit>().audioPlayer.playing
                              ? Icons.pause
                              : Icons.play_arrow_rounded,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Icon(
                      Icons.skip_next_rounded,
                      color: context.isDarkMode
                          ? AppColors.grey
                          : AppColors.darkGrey,
                      size: 30,
                    ),
                    Icon(
                      Icons.shuffle,
                      color: context.isDarkMode
                          ? AppColors.grey
                          : AppColors.darkGrey,
                      size: 30,
                    ),
                  ],
                ),
              ),
            ],
          );
        }

        return Container();
      },
    );
  }

  String formatDuration(Duration duration) {
    final minutes = duration.inMinutes.remainder(60);
    final seconds = duration.inSeconds.remainder(60);

    return "${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppBar(
        title: const Center(
          child: Text(
            "Now playing",
            style: TextStyle(fontSize: 18),
          ),
        ),
        action: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.more_vert_rounded),
        ),
      ),
      body: BlocProvider(
        create: (context) => SongPlayerCubit()..loadSong(song.fileName!),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 20),
                _renderThumbnail(),
                const SizedBox(height: 10),
                _renderSongInfo(context),
                _renderPlayerControl()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
