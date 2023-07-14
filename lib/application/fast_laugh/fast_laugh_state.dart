part of 'fast_laugh_bloc.dart';

@freezed
class FastLaughState with _$FastLaughState {
  const factory FastLaughState({
    required bool isLoading,
    required bool isError,
    required List<DownloadResultData> videoList,
  }) = _FastLaughState;

  factory FastLaughState.initial() => const FastLaughState(
        isLoading: true,
        isError: false,
        videoList: [],
      );
}
