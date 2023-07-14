part of 'search_bloc.dart';

@freezed
class SearchState with _$SearchState {
  const factory SearchState({
    required bool isLoading,
    required bool isError,
    required List<DownloadResultData> idleList,
    required List<SearchResultData> searchRespList,
  }) = _SearchState;

  factory SearchState.initial() => const SearchState(
        isLoading: true,
        isError: false,
        idleList: [],
        searchRespList: [],
      );
}
