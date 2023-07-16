// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix_clone_app/domain/core/failure/main_failure.dart';
import 'package:netflix_clone_app/domain/downloads/download_services.dart';

import '../../domain/downloads/model/download_resp.dart';

part 'fast_laugh_event.dart';
part 'fast_laugh_state.dart';
part 'fast_laugh_bloc.freezed.dart';

final dummyVideoUrls = [
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4",
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4",
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4",
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerEscapes.mp4",
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerJoyrides.mp4",
];

ValueNotifier<Set<int>> likedListNotifier = ValueNotifier({});
ValueNotifier<Set<int>> myListNotifier = ValueNotifier({});

@injectable
class FastLaughBloc extends Bloc<FastLaughEvent, FastLaughState> {
  FastLaughBloc(DownloadServices downloadServices)
      : super(FastLaughState.initial()) {
    on<_Initialize>((event, emit) async {
      emit(const FastLaughState(
        isLoading: true,
        isError: false,
        videoList: [],
      ));

      //get movies

      final _res = await downloadServices.getDownloadImages();

      final _state = _res.fold(
        (MainFailure l) {
          return const FastLaughState(
            isLoading: false,
            isError: true,
            videoList: [],
          );
        },
        (DownloadResp r) {
          return  FastLaughState(
            isLoading: false,
            isError: false,
            videoList: r.results,
          );
        },
      );

      //send to ui

      emit(_state);
    });
  }
}
