import 'package:flutter/material.dart';
import 'package:netflix_clone_app/core/colors/colors.dart';

class VideoListItem extends StatelessWidget {
  const VideoListItem({super.key, required this.index});

  final int index;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: Colors.accents[index % Colors.accents.length],
        ),
        Align(
          alignment: Alignment.bottomLeft,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                CircleAvatar(
                  radius: 25,
                  backgroundColor: Colors.black.withOpacity(0.5),
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.volume_off,
                      size: 30,
                    ),
                  ),
                ),
                const Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 10.0),
                      child: CircleAvatar(
                        backgroundImage: NetworkImage(
                            'https://www.themoviedb.org/t/p/w220_and_h330_face/fiVW06jE7z9YnO4trhaMEdclSiC.jpg'),
                      ),
                    ),
                    VideoActionWidget(
                      icon: Icons.emoji_emotions_outlined,
                      title: 'LOL',
                    ),
                    VideoActionWidget(icon: Icons.add, title: 'My List'),
                    VideoActionWidget(icon: Icons.share, title: 'Share'),
                    VideoActionWidget(icon: Icons.play_arrow, title: 'Play'),
                  ],
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}

class VideoActionWidget extends StatelessWidget {
  const VideoActionWidget({
    super.key,
    required this.icon,
    required this.title,
    this.iconSize = 30,
    this.textSize = 16,
    this.color = kcolorWhite,
   
  });

  final IconData icon;
  final String title;
  final double iconSize;
  final double textSize;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        children: [
          Icon(
            icon,
            color: kcolorWhite,
            size: iconSize,
          ),
          Text(
            title,
            style:  TextStyle(color: color, fontSize: textSize),
          ),
        ],
      ),
    );
  }
}
