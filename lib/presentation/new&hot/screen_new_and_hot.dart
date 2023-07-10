import 'package:flutter/material.dart';
import 'package:netflix_clone_app/core/colors/colors.dart';
import 'package:netflix_clone_app/presentation/new&hot/widgets/coming_soon_widget.dart';
import 'package:netflix_clone_app/presentation/new&hot/widgets/everyone_watching_widget.dart';

import '../../core/constants.dart';

class ScreenNewAndHot extends StatelessWidget {
  const ScreenNewAndHot({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'New & Hot',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w900,
            ),
          ),
          actions: [
            Row(
              children: [
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.cast,
                      color: Colors.white,
                      size: 30,
                    )),
                kwidth,
                Container(
                  width: 30,
                  height: 30,
                  color: Colors.blue,
                ),
                kwidth
              ],
            )
          ],
          bottom: TabBar(
              isScrollable: true,
              indicator: BoxDecoration(
                color: kcolorWhite,
                borderRadius: BorderRadius.circular(20),
              ),
              labelColor: kcolorBlack,
              labelStyle: const TextStyle(fontSize: 16,fontWeight: FontWeight.w600),
              unselectedLabelColor: kcolorWhite,
              unselectedLabelStyle: const TextStyle(fontSize: 16,fontWeight: FontWeight.w600),
              tabs: const [
                Tab(
                  text: '🍿 Coming Soon',
                ),
                Tab(
                  text: '👀 Everyone\'s watching',
                )
              ]),
        ),
        body: const TabBarView(
          children: [
           ComingSoonWidget(),
           EveryoneWatchingWidget(),
          ],
        ),
      ),
    );
  }
}


