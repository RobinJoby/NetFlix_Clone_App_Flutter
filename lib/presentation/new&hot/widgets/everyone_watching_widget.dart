// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_clone_app/application/newAndHot/new_and_hot_bloc.dart';
import 'package:netflix_clone_app/core/constant_strings.dart';
import 'package:netflix_clone_app/core/constants.dart';
import 'package:netflix_clone_app/presentation/FastLaugh/widgets/video_list_item.dart';

class EveryoneWatchingWidget extends StatelessWidget {
  const EveryoneWatchingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      BlocProvider.of<NewAndHotBloc>(context)
          .add(const NewAndHotEvent.getEveryoneWatchingData());
    });
    return BlocBuilder<NewAndHotBloc, NewAndHotState>(
      builder: (context, state) {
        if (state.isLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state.isError) {
          return const Center(
            child: Text('Oops Something went wrong'),
          );
        } else if (state.everyoneWatchingList.isEmpty) {
          return const Center(
            child: Text(' '),
          );
        } else {
          return ListView.separated(
              shrinkWrap: true,
              itemBuilder: (ctx, index) {
                final _movieData = state.everyoneWatchingList[index];

                return EveryoneWatchingListItem(
                  title: _movieData.title ?? '',
                  overview: _movieData.overview ?? ' ',
                  posterPath: '$imageAppendUrl${_movieData.posterPath}',
                );
              },
              separatorBuilder: (ctx, index) {
                return kheight55;
              },
              itemCount: state.everyoneWatchingList.length);
        }
      },
    );
  }
}

class EveryoneWatchingListItem extends StatelessWidget {
  final String title;
  final String overview;
  final String posterPath;

  const EveryoneWatchingListItem({
    super.key,
    required this.title,
    required this.overview,
    required this.posterPath,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            kheight,
             Text(
              overview,
              style: const TextStyle(
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
                  decoration:  BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(posterPath),
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
