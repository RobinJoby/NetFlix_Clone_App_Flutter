import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_clone_app/application/search/search_bloc.dart';
import 'package:netflix_clone_app/core/constants.dart';
import 'package:netflix_clone_app/domain/core/debounce/debounce.dart';
import 'package:netflix_clone_app/presentation/search/widgets/search_idle.dart';
import 'package:netflix_clone_app/presentation/search/widgets/search_result.dart';

class ScreenSearch extends StatelessWidget {
  ScreenSearch({super.key});

  final _debouncer = Debouncer(milliseconds: 2000);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CupertinoSearchTextField(
              // padding: EdgeInsets.only(left: 20),
              backgroundColor: Colors.grey.withOpacity(0.4),
              prefixIcon: const Icon(
                CupertinoIcons.search,
                color: Colors.grey,
              ),
              suffixIcon: const Icon(
                CupertinoIcons.xmark_circle_fill,
                color: Colors.grey,
              ),
              style: TextStyle(color: Colors.grey[300]),
              onChanged: (value) {
                if (value.isEmpty) {
                  return;
                } else {
                  _debouncer.run(() {
                    BlocProvider.of<SearchBloc>(context)
                        .add(SearchEvent.getSearchResp(value));
                  });
                }
              },
            ),
            kheight,
            BlocBuilder<SearchBloc, SearchState>(
              builder: (context, state) {
                if (state.searchRespList.isEmpty) {
                  return const Expanded(child: SearchIdle());
                } else {
                  return const Expanded(child: SearchResultWidget());
                }
              },
            )
          ],
        ),
      )),
    );
  }
}
