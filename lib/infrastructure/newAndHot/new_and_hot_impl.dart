// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix_clone_app/domain/core/api_end_points.dart';
import 'package:netflix_clone_app/domain/core/failure/main_failure.dart';
import 'package:netflix_clone_app/domain/newAndHot/model/new_and_hot_resp.dart';
import 'package:netflix_clone_app/domain/newAndHot/new_and_hot_services.dart';
import 'package:netflix_clone_app/infrastructure/api_key.dart';

@LazySingleton(as: NewAndHotServices)
class NewAndHotImpl implements NewAndHotServices {
  @override
  Future<Either<MainFailure, NewAndHotResp>> getComingSoonData() async {
    
    try {
      final _res = await Dio(BaseOptions()).get(
      ApiEndPoints.newAndHotComingSoom,
      queryParameters: {
        'api_key':apiKey,
      }
    );
    if(_res.statusCode == 200 || _res.statusCode == 201)
    {
      final _comingSoonData = NewAndHotResp.fromJson(_res.data);
      return Right(_comingSoonData);
    }
    else{
      return const Left(MainFailure.serverFailure());
    }
    } catch (e) {
      log(e.toString());
      return const Left( MainFailure.clientFailure());
    }

  }

  @override
  Future<Either<MainFailure, NewAndHotResp>> getEveryoneWatchingData() {
    throw UnimplementedError();
  }
}
