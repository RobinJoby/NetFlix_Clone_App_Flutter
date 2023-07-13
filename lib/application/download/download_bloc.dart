// ignore_for_file: depend_on_referenced_packages, no_leading_underscores_for_local_identifiers

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix_clone_app/domain/core/failure/main_failure.dart';
import 'package:netflix_clone_app/domain/downloads/download_services.dart';
import '../../domain/downloads/model/download_resp.dart';
part 'download_event.dart';
part 'download_state.dart';
part 'download_bloc.freezed.dart';

@injectable
class DownloadBloc extends Bloc<DownloadEvent, DownloadState> {
  final DownloadServices _downloadServices;
  DownloadBloc(this._downloadServices) : super(DownloadState.initial()) {
    on<_GetDownloadImage>((event, emit) async {
      if (state.downloadList.isNotEmpty) {
        emit(DownloadState(
          isLoading: false,
          isError: false,
          downloadList: state.downloadList,
        ));
        return;
      }
      emit(const DownloadState(
        isLoading: true,
        isError: false,
        downloadList: [],
      ));
      final _res = await _downloadServices.getDownloadImages();

      final _state = _res.fold(
        (MainFailure l) {
          return const DownloadState(
            isLoading: false,
            isError: true,
            downloadList: [],
          );
        },
        (DownloadResp r) {
          return DownloadState(
            isLoading: false,
            isError: false,
            downloadList: r.results,
          );
        },
      );
      emit(_state);
    });
  }
}
