import 'package:flutter/material.dart';
import 'package:netflix_clone_app/core/constants.dart';
import 'package:netflix_clone_app/presentation/search/widgets/title.dart';

const imageUrl =
    'https://www.themoviedb.org/t/p/w220_and_h330_face/NNxYkU70HPurnNCSiCjYAmacwm.jpg';

class SearchResultWidget extends StatelessWidget {
  const SearchResultWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SearchTextTitle(title: 'Moview & TV'),
        kheight,
        Expanded(
            child: GridView.count(
                shrinkWrap: true,
                crossAxisCount: 3,
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
                childAspectRatio: 1/1.4,
                children: List.generate(20, (index) {
                  return const MainCard();
                })))
      ],
    );
  }
}

class MainCard extends StatelessWidget {
  const MainCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:  BoxDecoration(
        borderRadius: BorderRadius.circular(7),
        image: const DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage(imageUrl),
        ),
      ),
    );
  }
}

