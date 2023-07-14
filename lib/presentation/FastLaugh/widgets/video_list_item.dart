import 'package:flutter/material.dart';
import 'package:netflix_clone_app/core/colors/colors.dart';

import '../../../core/constant_strings.dart';
import '../../../domain/downloads/model/download_resp.dart';

class VideoListItemInheritedWidget extends InheritedWidget {
  final Widget widget;
  final DownloadResultData movieData;

  const VideoListItemInheritedWidget(
      {Key? key, required this.widget, required this.movieData})
      : super(key: key, child: widget);

  @override
  bool updateShouldNotify(covariant VideoListItemInheritedWidget oldWidget) {
    return oldWidget.movieData != movieData;
  }

  static VideoListItemInheritedWidget of(BuildContext context){
    return context.dependOnInheritedWidgetOfExactType<VideoListItemInheritedWidget>()!;
  }    


}

class VideoListItem extends StatelessWidget {
  const VideoListItem({super.key, required this.index});

  final int index;

  @override
  Widget build(BuildContext context) {
    final _posterPath = VideoListItemInheritedWidget.of(context).movieData.posterPath;
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
                 Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: CircleAvatar(
                        backgroundImage:_posterPath == null ? null : NetworkImage('$imageAppendUrl$_posterPath'),
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
            style: TextStyle(color: color, fontSize: textSize),
          ),
        ],
      ),
    );
  }
}
