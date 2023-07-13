// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix_clone_app/domain/core/api_end_points.dart';
import 'package:netflix_clone_app/domain/core/failure/main_failure.dart';
import 'package:netflix_clone_app/domain/downloads/download_services.dart';
import 'package:netflix_clone_app/domain/downloads/model/download_resp.dart';
import 'package:dio/dio.dart';
import 'package:netflix_clone_app/infrastructure/api_key.dart';

@LazySingleton(as: DownloadServices)
class DownloadImpl implements DownloadServices {
  @override
  Future<Either<MainFailure, DownloadResp>> getDownloadImages() async {
    try {
      final _res = await Dio(BaseOptions()).get(
        ApiEndPoints.downloads,
        queryParameters: {
          'api_key':apiKey
        }
      );

      if (_res.statusCode == 200 || _res.statusCode == 201) {
        final _downloadResp = DownloadResp.fromJson(_res.data);
        return Right(_downloadResp);
      } else {
        return const Left(MainFailure.serverFailure());
      }
    } catch (e) {
      log(e.toString());
      return const Left(MainFailure.clientFailure());
    }
  }
}
