part of 'new_and_hot_bloc.dart';

@freezed
class NewAndHotState with _$NewAndHotState {
  const factory NewAndHotState({
    required bool isLoading,
    required bool isError,
    required List<NewAndHotResultData> comingSoonList,
    required List<NewAndHotResultData> everyoneWatchingList,
  }) = _NewAndHotState;

  factory NewAndHotState.initial() => const NewAndHotState(
        isLoading: false,
        isError: false,
        comingSoonList: [],
        everyoneWatchingList: [],
      );
}
