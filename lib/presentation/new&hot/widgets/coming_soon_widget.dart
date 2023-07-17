// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:netflix_clone_app/application/newAndHot/new_and_hot_bloc.dart';
import 'package:netflix_clone_app/core/colors/colors.dart';
import 'package:netflix_clone_app/core/constant_strings.dart';
import 'package:netflix_clone_app/core/constants.dart';
import 'package:netflix_clone_app/presentation/FastLaugh/widgets/video_list_item.dart';

class ComingSoonWidget extends StatelessWidget {
  const ComingSoonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<NewAndHotBloc>(context)
          .add(const NewAndHotEvent.getComingSoonData());
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
        } else if (state.comingSoonList.isEmpty) {
          return const Center(
            child: Text('No Movies found'),
          );
        } else {
          return ListView.separated(
            shrinkWrap: true,
            itemBuilder: (ctx, index) {
              final _movieData = state.comingSoonList[index];

              String _movieDay;
              String _movieMonth;

              try {
                final _date = DateFormat.yMMMMd()
                    .format(DateTime.tryParse(_movieData.releaseDate!)!);

                final _newDate = _date.split(',');

                final _formattedDate = _newDate.first.split(' ');

                _movieMonth =
                    _formattedDate.first.substring(0, 3).toUpperCase();
                _movieDay = _formattedDate.last;
              } catch (e) {
                _movieDay = ' ';
                _movieMonth = ' ';
              }
              return ComingSoonListItem(
                month: _movieMonth,
                day: _movieDay,
                posterPath: '$imageAppendUrl${_movieData.posterPath}',
                title: _movieData.title ?? '',
                overview: _movieData.overview ?? '',
              );
            },
            separatorBuilder: (ctx, index) {
              return kheight;
            },
            itemCount: 15,
          );
        }
      },
    );
  }
}

class ComingSoonListItem extends StatelessWidget {
  final String month;
  final String day;
  final String posterPath;
  final String title;
  final String overview;

  const ComingSoonListItem({
    super.key,
    required this.month,
    required this.day,
    required this.posterPath,
    required this.title,
    required this.overview,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(7.0, 20, 7, 0),
        child: Row(
          children: [
            SizedBox(
              width: 60,
              height: 520,
              child: Column(
                children: [
                  Text(
                    month,
                    style: GoogleFonts.roboto(
                      textStyle: const TextStyle(
                          fontSize: 23,
                          fontWeight: FontWeight.bold,
                          color: kcolorGrey,
                          letterSpacing: 2),
                    ),
                  ),
                  Text(
                    day,
                    style: GoogleFonts.roboto(
                      textStyle: const TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 4),
                    ),
                  )
                ],
              ),
            ),
            Expanded(
                child: Padding(
              padding: const EdgeInsets.only(top: 20),
              child: SizedBox(
                height: 500,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        Container(
                          width: double.infinity,
                          height: 180,
                          decoration: BoxDecoration(
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
                    kheigth20,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(title,
                              maxLines: 2,
                              overflow: TextOverflow.clip,
                              style: GoogleFonts.amaticSc(
                                textStyle: const TextStyle(
                                    fontSize: 35,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: -2,
                                    wordSpacing: -2),
                              )),
                        ),
                        const Row(
                          children: [
                            VideoActionWidget(
                              icon: Icons.notifications_none_outlined,
                              title: 'Remind Me',
                              iconSize: 25,
                              textSize: 13,
                            ),
                            kwidth20,
                            VideoActionWidget(
                              icon: Icons.info_outline,
                              title: 'info',
                              iconSize: 25,
                              textSize: 13,
                            ),
                            kwidth
                          ],
                        )
                      ],
                    ),
                    Text(
                      'Coming on $month $day',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    kheigth20,
                    Text(
                      title,
                      maxLines: 2,
                      overflow: TextOverflow.clip,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    kheight,
                    Text(
                      overview,
                      maxLines: 5,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey),
                      //overflow: TextOverflow.ellipsis,
                    )
                  ],
                ),
              ),
            ))
          ],
        ),
      ),
    );
  }
}
