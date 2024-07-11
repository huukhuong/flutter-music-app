import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spotify_clone/common/helpers/is_dark.dart';
import 'package:spotify_clone/common/widgets/app_bar/app_bar.dart';
import 'package:spotify_clone/core/config/assets/app_images.dart';
import 'package:spotify_clone/core/config/assets/app_vectors.dart';
import 'package:spotify_clone/core/config/theme/app_colors.dart';
import 'package:spotify_clone/domain/entities/song/song.dart';
import 'package:spotify_clone/presentation/home/widgets/news_song.dart';
import 'package:spotify_clone/presentation/home/widgets/playlist.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();

    _tabController = TabController(length: 4, vsync: this);
  }

  Widget _renderTopBanner() {
    return Center(
      child: SizedBox(
        height: 140,
        child: Stack(
          children: [
            Align(
              alignment: Alignment.bottomCenter,
              child: SvgPicture.asset(AppVectors.homeTopCard),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.only(right: 60),
                child: Image.asset(AppImages.homeArtist),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _renderTabs() {
    return TabBar(
      controller: _tabController,
      labelPadding: const EdgeInsets.only(top: 14, bottom: 12),
      labelColor: context.isDarkMode ? Colors.white : Colors.black,
      labelStyle: const TextStyle(fontWeight: FontWeight.w500),
      indicatorColor: AppColors.primary,
      dividerHeight: 0,
      tabs: const [
        Text("News"),
        Text("Videos"),
        Text("Artists"),
        Text("Podcasts"),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppBar(
        hiddenBack: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              AppVectors.logo,
              height: 40,
            ),
            const SizedBox(width: 45)
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _renderTopBanner(),
            _renderTabs(),
            SizedBox(
              height: 300,
              child: TabBarView(
                controller: _tabController,
                children: [
                  const NewsSong(),
                  Container(),
                  Container(),
                  Container(),
                ],
              ),
            ),
            const Playlist(),
          ],
        ),
      ),
    );
  }
}
