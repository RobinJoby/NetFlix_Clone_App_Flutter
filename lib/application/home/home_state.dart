part of 'home_bloc.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState({
    required String id,
    required bool isLoading,
    required bool isError,
    required List<NewAndHotResultData> pastYearList,
    required List<NewAndHotResultData> trendingNowList,
    required List<NewAndHotResultData> topTenList,
    required List<NewAndHotResultData> tenseDramaList,
    required List<NewAndHotResultData> southIndianList,
  }) = _HomeState;

  factory HomeState.initial() => const HomeState(
        id: '0',
        isLoading: false,
        isError: false,
        pastYearList: [],
        trendingNowList: [],
        topTenList: [],
        tenseDramaList: [],
        southIndianList: [],
      );
}
