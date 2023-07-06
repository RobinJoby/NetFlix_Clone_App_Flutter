import 'package:flutter/material.dart';
import 'package:netflix_clone_app/presentation/FastLaugh/screen_fast_laugh.dart';
import 'package:netflix_clone_app/presentation/home/screen_home.dart';
import 'package:netflix_clone_app/presentation/main_page/widgets/bottom_nav.dart';
import 'package:netflix_clone_app/presentation/new&hot/screen_new_and_hot.dart';
import 'package:netflix_clone_app/presentation/search/screen_search.dart';

import '../downloads/screen_downloads.dart';

class ScreenMainPage extends StatelessWidget {
  const ScreenMainPage({super.key});

  final _pages = const [
    ScreenHome(),
    ScreenNewAndHot(),
    ScreenFastLaugh(),
    ScreenSearch(),
    ScreenDownloads(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: ValueListenableBuilder(
        valueListenable: indexChangeNotifier,
        builder: (BuildContext ctx, int newIndex, Widget? _) {
          {
            return _pages[newIndex];
          }
        },
      ),
      bottomNavigationBar: const BottomNavigationWidget(),
    );
  }
}
