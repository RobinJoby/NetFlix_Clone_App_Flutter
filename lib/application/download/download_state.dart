part of 'download_bloc.dart';

@freezed
class DownloadState with _$DownloadState {
  const factory DownloadState({
    required bool isLoading,
    required bool isError,
    required List<DownloadResultData> downloadList,
  }) = _DownloadState;

  factory DownloadState.initial() => const DownloadState(
        isLoading: true,
        isError: false,
        downloadList: [],
      );
}
