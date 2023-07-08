import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix_clone_app/core/colors/colors.dart';
import 'package:netflix_clone_app/core/constants.dart';
import 'package:netflix_clone_app/presentation/search/widgets/title.dart';

const imageUrl =
    'https://www.themoviedb.org/t/p/w355_and_h200_multi_faces/nf3Vlxm3C9U1aKUUQHmKFZmxPSc.jpg';

class SearchIdle extends StatelessWidget {
  const SearchIdle({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SearchTextTitle(title: 'Top Searches',),
        kheight,
        Expanded(
          child: ListView.separated(
              shrinkWrap: true,
              itemBuilder: (ctx, index) {
                return const TopSearchItemTile();
              },
              separatorBuilder: (ctx, index) {
                return kheigth20;
              },
              itemCount: 10),
        )
      ],
    );
  }
}



class TopSearchItemTile extends StatelessWidget {
  const TopSearchItemTile({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size;
    return Row(
      children: [
        Container(
          width: screenWidth.width * 0.33,
          height: 80,
          decoration: const BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(imageUrl),
            ),
          ),
        ),
        kwidth,
        const Expanded(
            child: Text(
          'Movie Name',
          style: TextStyle(
            color: kcolorWhite,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        )),
        const CircleAvatar(
          radius: 24,
          backgroundColor: kcolorWhite,
          child: CircleAvatar(
            radius: 23,
            backgroundColor: kcolorBlack,
            child: Center(
                child: Icon(
              CupertinoIcons.play_fill,
            )),
          ),
        )
      ],
    );
  }
}
