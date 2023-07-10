import 'package:flutter/material.dart';
import 'package:netflix_clone_app/core/constants.dart';
import 'package:netflix_clone_app/presentation/FastLaugh/widgets/video_list_item.dart';

class EveryoneWatchingWidget extends StatelessWidget {
  const EveryoneWatchingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
        itemBuilder: (ctx, index) {
          return const EveryoneWatchingListItem();
        },
        separatorBuilder: (ctx, index) {
          return kheight55;
        },
        itemCount: 10);
  }
}

class EveryoneWatchingListItem extends StatelessWidget {
  const EveryoneWatchingListItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Friends',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            kheight,
            const Text(
              'Follow the lives of six reckless adults living in Manhattan, as they indulge in adventures which make their lives both troublesome and happening.',
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey),
              //overflow: TextOverflow.ellipsis,
            ),
            kheight30,
            Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: 180,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(newAndHotTempImage2),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 8,
                  right: 8,
                  child: CircleAvatar(
                    radius: 20,
                    backgroundColor: Colors.black.withOpacity(0.8),
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.volume_off,
                        size: 20,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            kheight,
            const Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                VideoActionWidget(
                  icon: Icons.share,
                  title: 'Share',
                  color: Colors.grey,
                ),
                kwidth,
                VideoActionWidget(
                  icon: Icons.add,
                  title: 'My List',
                  color: Colors.grey,
                ),
                kwidth,
                VideoActionWidget(
                  icon: Icons.play_arrow_rounded,
                  title: 'Play',
                  color: Colors.grey,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
