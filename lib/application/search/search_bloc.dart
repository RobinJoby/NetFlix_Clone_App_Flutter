// ignore_for_file: depend_on_referenced_packages, no_leading_underscores_for_local_identifiers, avoid_print

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix_clone_app/domain/core/failure/main_failure.dart';
import 'package:netflix_clone_app/domain/downloads/download_services.dart';
import 'package:netflix_clone_app/domain/search/search_services.dart';
import '../../domain/downloads/model/download_resp.dart';
import '../../domain/search/model/search_resp.dart';

part 'search_event.dart';
part 'search_state.dart';
part 'search_bloc.freezed.dart';

@injectable
class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final SearchServices _searchServices;
  final DownloadServices _downloadServices;

  SearchBloc(this._downloadServices, this._searchServices)
      : super(SearchState.initial()) {

    on<_Initialize>((event, emit) async {
      if (state.idleList.isNotEmpty) {
        emit(SearchState(
          isLoading: false,
          isError: false,
          idleList: state.idleList,
          searchRespList: [],
        ));
        return;
      }
      emit(const SearchState(
        isLoading: true,
        isError: false,
        idleList: [],
        searchRespList: [],
      ));

      //api call

      final _res = await _downloadServices.getDownloadImages();

      final _state = _res.fold(
        (MainFailure l) {
          return const SearchState(
            isLoading: false,
            isError: true,
            idleList: [],
            searchRespList: [],
          );
        },
        (DownloadResp r) {
          return SearchState(
            isLoading: false,
            isError: false,
            idleList: r.results,
            searchRespList: [],
          );
        },
      );
      emit(_state);
    });

    on<_GetSearchResp>((event, emit) async {
     
      emit(
       const SearchState(
          isLoading: true,
          isError: false,
          idleList: [],
          searchRespList: [],
        ),
      );

      final _res = await _searchServices.getSearchResp(event.movieQuery);

      final _state = _res.fold(
        (MainFailure l) {
          return  const SearchState(
            isLoading: false,
            isError: true,
            idleList: [],
            searchRespList: [],
          );
        },
        (SearchResp r) {
          return SearchState(
              isLoading: false,
              isError: false,
              idleList: [],
              searchRespList: r.results);
        },
      );
      emit(_state);
    });
  }
}
