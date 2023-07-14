// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_clone_app/application/fast_laugh/fast_laugh_bloc.dart';
import 'package:netflix_clone_app/presentation/FastLaugh/widgets/video_list_item.dart';

class ScreenFastLaugh extends StatelessWidget {
  const ScreenFastLaugh({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        BlocProvider.of<FastLaughBloc>(context)
            .add(const FastLaughEvent.initialize());
      },
    );
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<FastLaughBloc, FastLaughState>(
          builder: (context, state) {
            if (state.isLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state.isError) {
              return const Center(child: Text('Error while Loading'));
            } else if (state.videoList.isEmpty) {
              return const Center(
                child: Text('Video List Empty'),
              );
            } else {
              return PageView(
                scrollDirection: Axis.vertical,
                children: List.generate(state.videoList.length, (index) {
                  final _movie = state.videoList[index];
                  return VideoListItemInheritedWidget(
                      widget: VideoListItem(
                        index: index,
                      ),
                      movieData: _movie);
                }),
              );
            }
          },
        ),
      ),
    );
  }
}
