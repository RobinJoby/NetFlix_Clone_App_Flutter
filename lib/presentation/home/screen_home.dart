import 'package:flutter/material.dart';
import 'package:netflix_clone_app/presentation/home/widgets/number_card_widget.dart';


import '../widgets/main_title_card_widget.dart';


class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    
    return  Scaffold(
      body: SafeArea(
        child: ListView(
          children: const [
            MainTitleCard(title: 'Released in the past year',),
            MainTitleCard(title: 'Trending Now'),
            NumberCardWidget(title: 'Top 10 TV Shows in India Today'),
            MainTitleCard(title: 'Tense Dramas'),
            MainTitleCard(title: 'South Indian Cinema')
          ],
        ),
      ),
    );
  }
}


