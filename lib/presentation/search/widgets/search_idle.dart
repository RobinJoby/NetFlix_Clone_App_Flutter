// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_clone_app/application/search/search_bloc.dart';
import 'package:netflix_clone_app/core/colors/colors.dart';
import 'package:netflix_clone_app/core/constant_strings.dart';
import 'package:netflix_clone_app/core/constants.dart';
import 'package:netflix_clone_app/presentation/search/widgets/title.dart';

class SearchIdle extends StatelessWidget {
  const SearchIdle({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        BlocProvider.of<SearchBloc>(context)
            .add(const SearchEvent.initialize());
      },
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SearchTextTitle(
          title: 'Top Searches',
        ),
        kheight,
        BlocBuilder<SearchBloc, SearchState>(
          builder: (context, state) {
            if (state.isLoading) {
              return const Expanded(
                  child: Center(
                child: CircularProgressIndicator(),
              ));
            } else if (state.isError) {
              return const Expanded(
                  child: Center(
                child: Text('Oops! Something went wrong'),
              ));
            }
            return Expanded(
              child: ListView.separated(
                  shrinkWrap: true,
                  itemBuilder: (ctx, index) {
                    final _movie = state.idleList[index];
                    return TopSearchItemTile(
                        title: _movie.title ?? 'No title Provided',
                        imageUrl: "$imageAppendUrl${_movie.posterPath}");
                  },
                  separatorBuilder: (ctx, index) {
                    return kheigth20;
                  },
                  itemCount: state.idleList.length),
            );
          },
        )
      ],
    );
  }
}

class TopSearchItemTile extends StatelessWidget {
  const TopSearchItemTile({
    super.key,
    required this.title,
    required this.imageUrl,
  });

  final String title;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size;
    return Row(
      children: [
        Container(
          width: screenWidth.width * 0.33,
          height: 80,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(imageUrl),
            ),
          ),
        ),
        kwidth,
        Expanded(
            child: Text(
          title,
          style: const TextStyle(
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
