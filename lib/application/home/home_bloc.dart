// ignore_for_file: depend_on_referenced_packages, no_leading_underscores_for_local_identifiers

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/core/failure/main_failure.dart';
import '../../domain/newAndHot/model/new_and_hot_resp.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../domain/newAndHot/new_and_hot_services.dart';

part 'home_event.dart';
part 'home_state.dart';
part 'home_bloc.freezed.dart';

@injectable
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final NewAndHotServices _newAndHotServices;
  HomeBloc(this._newAndHotServices) : super(HomeState.initial()) {
    on<_GetHomeData>((event, emit) async {
      if (state.pastYearList.isNotEmpty ||
          state.trendingNowList.isNotEmpty ||
          state.topTenList.isNotEmpty ||
          state.tenseDramaList.isNotEmpty ||
          state.southIndianList.isNotEmpty) {
        emit(
          HomeState(
            id: state.id,
            isLoading: false,
            isError: false,
            pastYearList: state.pastYearList,
            trendingNowList: state.trendingNowList,
            topTenList: state.topTenList,
            tenseDramaList: state.tenseDramaList,
            southIndianList: state.southIndianList,
          ),
        );
        return;
      }

      emit(HomeState(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        isLoading: true,
        isError: false,
        pastYearList: [],
        trendingNowList: [],
        topTenList: [],
        tenseDramaList: [],
        southIndianList: [],
      ));

      final _res = await _newAndHotServices.getComingSoonData();
      final _res2 = await _newAndHotServices.getEveryoneWatchingData();

      final _state1 = _res.fold(
        (MainFailure l) {
          return HomeState(
            id: DateTime.now().millisecondsSinceEpoch.toString(),
            isLoading: false,
            isError: true,
            pastYearList: [],
            trendingNowList: [],
            topTenList: state.topTenList,
            tenseDramaList: [],
            southIndianList: [],
          );
        },
        (NewAndHotResp r) {
          final pastYear = r.results;
          final trendingNow = r.results;
          final tenseDrama = r.results;
          final southIndian = r.results;

          pastYear.shuffle();
          trendingNow.shuffle();
          tenseDrama.shuffle();
          southIndian.shuffle();

          return HomeState(
            id: DateTime.now().millisecondsSinceEpoch.toString(),
            isLoading: false,
            isError: false,
            pastYearList: pastYear,
            trendingNowList: trendingNow,
            topTenList: state.topTenList,
            tenseDramaList: tenseDrama,
            southIndianList: southIndian,
          );
        },
      );

      emit(_state1);

      final _state2 = _res2.fold(
        (MainFailure l) {
          return HomeState(
            id: DateTime.now().millisecondsSinceEpoch.toString(),
            isLoading: false,
            isError: true,
            pastYearList: state.pastYearList,
            trendingNowList: state.trendingNowList,
            topTenList: [],
            tenseDramaList: state.tenseDramaList,
            southIndianList: state.southIndianList,
          );
        },
        (NewAndHotResp r) {
          final topTen = r.results;

          topTen.shuffle();

          return HomeState(
            id: DateTime.now().millisecondsSinceEpoch.toString(),
            isLoading: false,
            isError: false,
            pastYearList: state.pastYearList,
            trendingNowList: state.trendingNowList,
            topTenList: topTen,
            tenseDramaList: state.tenseDramaList,
            southIndianList: state.southIndianList,
          );
        },
      );

      emit(_state2);
    });
  }
}
