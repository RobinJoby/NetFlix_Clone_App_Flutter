import 'dart:math';

import 'package:flutter/material.dart';
import 'package:netflix_clone_app/core/colors/colors.dart';
import 'package:netflix_clone_app/core/constants.dart';
import 'package:netflix_clone_app/presentation/widgets/app_bar_widget.dart';

class ScreenDownloads extends StatelessWidget {
  const ScreenDownloads({super.key});

  final List imageList = const [
    'https://www.themoviedb.org/t/p/w220_and_h330_face/fiVW06jE7z9YnO4trhaMEdclSiC.jpg',
    'https://www.themoviedb.org/t/p/w220_and_h330_face/2Gfjn962aaFSD6eST6QU3oLDZTo.jpg',
    'https://www.themoviedb.org/t/p/w220_and_h330_face/vZloFAK7NmvMGKE7VkF5UHaz0I.jpg'
  ];

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: AppBarWidget(
            title: 'Downloads',
          ),
        ),
        body: ListView(
          children: [
            const Row(
              children: [
                kwidth,
                Icon(
                  Icons.settings,
                  color: kcolorWhite,
                ),
                kwidth,
                Text('Smart Downloads')
              ],
            ),
            const Text('Introducing Downloads for you'),
            const Text(
                'We will download personalised selection of movies and shows for you, so there is always something to watch on your device'),
            Container(
              width: size.width,
              height: size.width,
              color: kcolorWhite,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  CircleAvatar(
                    radius: size.width * 0.37,
                  ),
                  DownloadImageWidget(
                    size: Size(size.width * 0.4, size.width * 0.58),
                    imageList: imageList[0],
                    margin: const EdgeInsets.only(
                      left: 130,
                      bottom: 50,
                    ),
                    angle: 20,
                  ),
                  DownloadImageWidget(
                    size: Size(size.width * 0.4, size.width * 0.58),
                    imageList: imageList[1],
                    
                    margin:const  EdgeInsets.only(right: 130, bottom: 50),
                    angle: -20,
                  ),
                  DownloadImageWidget(
                    size: Size(size.width * 0.5, size.width * 0.68),
                    imageList: imageList[2],
                    margin: const EdgeInsets.only(bottom: 12),
                    borderRadius: 20,
                  ),
                ],
              ),
            ),
            MaterialButton(
              color: kButtonColorBlue,
              onPressed: () {},
              child: const Text(
                'Set up',
                style: TextStyle(
                    color: kcolorWhite,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ),
            MaterialButton(
              color: kButtonColorWhite,
              onPressed: () {},
              child: const Text(
                'See what you can download',
                style: TextStyle(
                    color: kcolorBlack,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            )
          ],
        ));
  }
}

class DownloadImageWidget extends StatelessWidget {
  const DownloadImageWidget(
      {super.key,
      required this.imageList,
      required this.margin,
      required this.size,
      this.borderRadius = 10,
      this.angle = 0});

  final String imageList;
  final double angle;
  final EdgeInsets margin;
  final Size size;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: angle * pi / 180,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(borderRadius),
        child: Container(
          margin: margin,
          width: size.width,
          height: size.height,
          decoration: BoxDecoration(
            
            image: DecorationImage(image: NetworkImage(imageList)),
          ),
        ),
      ),
    );
  }
}
