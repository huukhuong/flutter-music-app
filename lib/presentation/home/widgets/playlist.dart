import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify_clone/common/helpers/is_dark.dart';
import 'package:spotify_clone/core/config/theme/app_colors.dart';
import 'package:spotify_clone/presentation/home/bloc/playlist_cubit.dart';
import 'package:spotify_clone/presentation/home/bloc/playlist_state.dart';

class Playlist extends StatelessWidget {
  const Playlist({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => PlaylistCubit()..getPlaylist(),
      child:
          BlocBuilder<PlaylistCubit, PlaylistState>(builder: (context, state) {
        if (state is PlaylistLoading) {
          return Container(
            alignment: Alignment.center,
            child: const CircularProgressIndicator(
              color: AppColors.primary,
            ),
          );
        }

        if (state is PlaylistLoaded) {
          return Column(
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 16, right: 16, bottom: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Playlist",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "See more",
                      style: TextStyle(fontSize: 14),
                    ),
                  ],
                ),
              ),
              ...state.playlist.map(
                (song) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Container(
                                height: 45,
                                width: 45,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: context.isDarkMode
                                        ? AppColors.darkGrey
                                        : const Color(0xffE6E6E6)),
                                child: Icon(
                                  Icons.play_arrow_rounded,
                                  color: context.isDarkMode
                                      ? const Color(0xff959595)
                                      : const Color(0xff555555),
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "${song.title}",
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    "${song.artist}",
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 11,
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 20)
                    ],
                  ),
                ),
              ),
            ],
          );
        }

        return Container();
      }),
    );
  }
}
