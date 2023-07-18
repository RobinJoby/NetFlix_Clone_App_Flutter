// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_clone_app/application/home/home_bloc.dart';
import 'package:netflix_clone_app/presentation/home/widgets/Home_Main_bar.dart';
import 'package:netflix_clone_app/presentation/home/widgets/main_image_widget.dart';
import 'package:netflix_clone_app/presentation/home/widgets/number_card_widget.dart';
import '../widgets/main_title_card_widget.dart';

ValueNotifier<bool> scrollNotifier = ValueNotifier(true);

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<HomeBloc>(context).add(const HomeEvent.getHomeData());
    });
    return Scaffold(
      body: SafeArea(
        child: ValueListenableBuilder(
            valueListenable: scrollNotifier,
            builder: (context, newBool, _) {
              return Stack(
                children: [
                  NotificationListener<UserScrollNotification>(
                    onNotification: (notification) {
                      final ScrollDirection direction = notification.direction;
                      if (direction == ScrollDirection.forward) {
                        scrollNotifier.value = true;
                      } else if (direction == ScrollDirection.reverse) {
                        scrollNotifier.value = false;
                      }
                      return true;
                    },
                    child: RefreshIndicator(
                      onRefresh: () async {
                        BlocProvider.of<HomeBloc>(context)
                            .add(const HomeEvent.getHomeData());
                      },
                      child: BlocBuilder<HomeBloc, HomeState>(
                        builder: (context, state) {
                          if (state.isLoading) {
                            return const Center(
                              child: CircularProgressIndicator(
                                strokeWidth: 2,
                              ),
                            );
                          } else if (state.isError) {
                            return const Center(
                                child: Text('Oops! Something went wrong'));
                          } else if (state.pastYearList.isEmpty ||
                              state.trendingNowList.isEmpty ||
                              state.tenseDramaList.isEmpty ||
                              state.trendingNowList.isEmpty ||
                              state.topTenList.isEmpty) {
                            return const Center(
                              child: Text(' '),
                            );
                          } else {
                            final _pastYearList = state.pastYearList.map((e) {
                              return e.posterPath ?? ' ';
                            }).toList();

                            final _trendingList =
                                state.trendingNowList.map((e) {
                              return e.posterPath ?? ' ';
                            }).toList();

                            final _tenseDramaList =
                                state.tenseDramaList.map((e) {
                              return e.posterPath ?? ' ';
                            }).toList();

                            final _sounthIndianList =
                                state.southIndianList.map((e) {
                              return e.posterPath ?? ' ';
                            }).toList();

                            final _topTenList = state.topTenList.map((e) {
                              return e.posterPath ?? ' ';
                            }).toList();

                            _pastYearList.shuffle();
                            _trendingList.shuffle();
                            _tenseDramaList.shuffle();
                            _sounthIndianList.shuffle();
                            _pastYearList.shuffle();

                            return ListView(
                              children: [
                                MainImageWidget(
                                  posterPath: _topTenList.first,
                                ),
                                MainTitleCard(
                                  title: 'Released in the past year',
                                  posterPathList: _pastYearList.sublist(0, 10),
                                ),
                                MainTitleCard(
                                  title: 'Trending Now',
                                  posterPathList: _trendingList.sublist(0, 10),
                                ),
                                NumberCardWidget(
                                  title: 'Top 10 TV Shows in India Today',
                                  posterPathList: _topTenList.sublist(0, 10),
                                ),
                                MainTitleCard(
                                  title: 'Tense Dramas',
                                  posterPathList:
                                      _tenseDramaList.sublist(0, 10),
                                ),
                                MainTitleCard(
                                  title: 'South Indian Cinema',
                                  posterPathList:
                                      _sounthIndianList.sublist(0, 10),
                                )
                              ],
                            );
                          }
                        },
                      ),
                    ),
                  ),
                  scrollNotifier.value == true
                      ? const HomeMainBar()
                      : const SizedBox()
                ],
              );
            }),
      ),
    );
  }
}
