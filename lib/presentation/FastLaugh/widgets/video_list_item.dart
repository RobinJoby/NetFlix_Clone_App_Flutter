// ignore_for_file: no_leading_underscores_for_local_identifiers, invalid_use_of_visible_for_testing_member, invalid_use_of_protected_member

import 'package:flutter/material.dart';
import 'package:netflix_clone_app/application/fast_laugh/fast_laugh_bloc.dart';
import 'package:netflix_clone_app/core/colors/colors.dart';
import 'package:video_player/video_player.dart';
import '../../../core/constant_strings.dart';
import '../../../domain/downloads/model/download_resp.dart';
import 'package:share_plus/share_plus.dart';

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

  static VideoListItemInheritedWidget of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<VideoListItemInheritedWidget>()!;
  }
}

class VideoListItem extends StatelessWidget {
  const VideoListItem({super.key, required this.index});

  final int index;

  @override
  Widget build(BuildContext context) {
    final _posterPath =
        VideoListItemInheritedWidget.of(context).movieData.posterPath;
    return Stack(
      children: [
        VideoPlayerFastLaugh(
          videoUrl: dummyVideoUrls[index % dummyVideoUrls.length],
          onStateChanged: (bool) {},
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
                        backgroundImage: _posterPath == null
                            ? null
                            : NetworkImage('$imageAppendUrl$_posterPath'),
                      ),
                    ),
                    ValueListenableBuilder(
                        valueListenable: likedListNotifier,
                        builder: (context, newList, _) {
                          if (newList.contains(index)) {
                            return GestureDetector(
                              onTap: () {
                                likedListNotifier.value.remove(index);
                                likedListNotifier.notifyListeners();
                              },
                              child: const VideoActionWidget(
                                icon: Icons.emoji_emotions_outlined,
                                title: 'LOL',
                                iconColor: Colors.red,
                              ),
                            );
                          }
                          return GestureDetector(
                            onTap: () {
                              likedListNotifier.value.add(index);
                              likedListNotifier.notifyListeners();
                            },
                            child: const VideoActionWidget(
                              icon: Icons.emoji_emotions_outlined,
                              title: 'LOL',
                            ),
                          );
                        }),
                    ValueListenableBuilder(
                        valueListenable: myListNotifier,
                        builder: (context, newList, _) {
                          if (newList.contains(index)) {
                            return GestureDetector(
                              onTap: () {
                                myListNotifier.value.remove(index);
                                myListNotifier.notifyListeners();
                              },
                              child: const VideoActionWidget(
                                icon: Icons.check_circle_outline,
                                title: 'My List',
                                iconColor: Colors.red,
                              ),
                            );
                          } else {
                            return GestureDetector(
                              onTap: () {
                                myListNotifier.value.add(index);
                                myListNotifier.notifyListeners();
                              },
                              child: const VideoActionWidget(
                                icon: Icons.add,
                                title: 'My List',
                              ),
                            );
                          }
                        }),
                    GestureDetector(
                      onTap: () {
                        if (_posterPath != null) {
                          Share.share(_posterPath);
                        } else {
                          return;
                        }
                      },
                      child: const VideoActionWidget(
                        icon: Icons.share,
                        title: 'Share',
                      ),
                    ),
                    const VideoActionWidget(
                      icon: Icons.play_arrow,
                      title: 'Play',
                    ),
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
    this.iconColor = kcolorWhite,
  });

  final IconData icon;
  final String title;
  final double iconSize;
  final double textSize;
  final Color color;
  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        children: [
          Icon(
            icon,
            color: iconColor,
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

class VideoPlayerFastLaugh extends StatefulWidget {
  const VideoPlayerFastLaugh(
      {super.key, required this.videoUrl, required this.onStateChanged});

  final String videoUrl;
  final void Function(bool isPlaying) onStateChanged;

  @override
  State<VideoPlayerFastLaugh> createState() => _VideoPlayerFastLaughState();
}

class _VideoPlayerFastLaughState extends State<VideoPlayerFastLaugh> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.networkUrl(Uri.parse(widget.videoUrl));
    _controller.initialize().then((value) {
      setState(() {});
    });

    _controller.play();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: _controller.value.isInitialized
          ? AspectRatio(
              aspectRatio: _controller.value.aspectRatio,
              child: VideoPlayer(_controller))
          : Container(),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
