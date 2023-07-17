// ignore_for_file: depend_on_referenced_packages, no_leading_underscores_for_local_identifiers

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_clone_app/domain/core/failure/main_failure.dart';
import 'package:netflix_clone_app/domain/newAndHot/new_and_hot_services.dart';
import '../../domain/newAndHot/model/new_and_hot_resp.dart';

part 'new_and_hot_event.dart';
part 'new_and_hot_state.dart';
part 'new_and_hot_bloc.freezed.dart';

@injectable
class NewAndHotBloc extends Bloc<NewAndHotEvent, NewAndHotState> {
  final NewAndHotServices _newAndHotServices;

  NewAndHotBloc(this._newAndHotServices) : super(NewAndHotState.initial()) {
    on<_GetComingSoonData>((event, emit) async {

      if (state.comingSoonList.isNotEmpty) {
        emit(
          NewAndHotState(
            isLoading: false,
            isError: false,
            comingSoonList: state.comingSoonList,
            everyoneWatchingList: state.everyoneWatchingList,
          ),
        );

        return;
      }
      
      emit( NewAndHotState(
        isLoading: true,
        isError: false,
        comingSoonList: [],
        everyoneWatchingList: state.everyoneWatchingList,
      ));

      final _res = await _newAndHotServices.getComingSoonData();

      final _state = _res.fold(
        (MainFailure l) {
          return NewAndHotState(
            isLoading: false,
            isError: true,
            comingSoonList: [],
            everyoneWatchingList: state.everyoneWatchingList,
          );
        },
        (NewAndHotResp r) {
          return NewAndHotState(
            isLoading: false,
            isError: false,
            comingSoonList: r.results,
            everyoneWatchingList: state.everyoneWatchingList,
          );
        },
      );

      emit(_state);
    });

    on<_GetEveryoneWatchingData>((event, emit) async {

      if (state.everyoneWatchingList.isNotEmpty) {
        emit(
          NewAndHotState(
            isLoading: false,
            isError: false,
            comingSoonList: state.comingSoonList,
            everyoneWatchingList: state.everyoneWatchingList,
          ),
        );

        return;
      }
      
      emit(NewAndHotState(
        isLoading: true,
        isError: false,
        comingSoonList: state.comingSoonList,
        everyoneWatchingList: [],
      ));

      final _res = await _newAndHotServices.getEveryoneWatchingData();

      final _state = _res.fold(
        (MainFailure l) {
          return  NewAndHotState(
            isLoading: false,
            isError: true,
            comingSoonList: state.comingSoonList,
            everyoneWatchingList: [],
          );
        },
        (NewAndHotResp r) {
          return NewAndHotState(
            isLoading: false,
            isError: false,
            comingSoonList: state.comingSoonList,
            everyoneWatchingList: r.results,
          );
        },
      );

      emit(_state);
    });

  }

  
}
