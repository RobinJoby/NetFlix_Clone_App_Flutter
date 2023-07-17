part of 'new_and_hot_bloc.dart';

@freezed
class NewAndHotEvent with _$NewAndHotEvent {

  const factory NewAndHotEvent.getComingSoonData() = _GetComingSoonData;
  
  const factory NewAndHotEvent.getEveryoneWatchingData() = _GetEveryoneWatchingData;
}