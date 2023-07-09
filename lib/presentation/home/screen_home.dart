import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:netflix_clone_app/presentation/home/widgets/Home_Main_bar.dart';
import 'package:netflix_clone_app/presentation/home/widgets/main_image_widget.dart';
import 'package:netflix_clone_app/presentation/home/widgets/number_card_widget.dart';
import '../widgets/main_title_card_widget.dart';

ValueNotifier<bool> scrollNotifier = ValueNotifier(true);

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: SafeArea(
        child: ValueListenableBuilder(
          valueListenable: scrollNotifier,
          builder: (context,newBool,_) {
            return Stack(
              children: [
                NotificationListener<UserScrollNotification>(
                  onNotification: (notification) {
                    final ScrollDirection direction = notification.direction;
                    if(direction == ScrollDirection.forward)
                    {
                      scrollNotifier.value = true;
                    }
                    else if(direction == ScrollDirection.reverse)
                    {
                      scrollNotifier.value = false;
                    }
                    return true;
                  },
                  child: ListView(
                    children: const [
                      MainImageWidget(),
                      MainTitleCard(title: 'Released in the past year'),
                      MainTitleCard(title: 'Trending Now'),
                      NumberCardWidget(title: 'Top 10 TV Shows in India Today'),
                      MainTitleCard(title: 'Tense Dramas'),
                      MainTitleCard(title: 'South Indian Cinema')
                    ],
                  ),
                ),
                scrollNotifier.value == true ? const HomeMainBar() : const SizedBox()
              ],
            );
          }
        ),
      ),
    );
  }
}


