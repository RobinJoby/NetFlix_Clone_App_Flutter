import 'package:dartz/dartz.dart';
import 'package:netflix_clone_app/domain/core/failure/main_failure.dart';

import 'model/search_resp.dart';

abstract class SearchServices{
  Future<Either<MainFailure,SearchResp>> getSearchResp(String movieQuery);
}