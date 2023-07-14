// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix_clone_app/domain/core/api_end_points.dart';

import 'package:netflix_clone_app/domain/core/failure/main_failure.dart';

import 'package:netflix_clone_app/domain/search/model/search_resp.dart';
import 'package:netflix_clone_app/infrastructure/api_key.dart';

import '../../domain/search/search_services.dart';

@LazySingleton(as: SearchServices)
class SearchImpl implements SearchServices {
  @override
  Future<Either<MainFailure, SearchResp>> getSearchResp(
      String movieQuery) async {
    try {
      final _res = await Dio(BaseOptions()).get(
        ApiEndPoints.search,
        queryParameters: {
          'api_key': apiKey,
          'query': movieQuery,
        }
      );
      if(_res.statusCode == 200 || _res.statusCode == 201)
      {
       final _searchResp = SearchResp.fromJson(_res.data);
       return Right(_searchResp);
      }
      else{
        return const Left(MainFailure.serverFailure());
      }
    } catch (e) {
      log(e.toString());
      return const Left(MainFailure.clientFailure());
    }
  }
}
