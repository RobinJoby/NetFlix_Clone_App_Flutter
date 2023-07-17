import 'package:dartz/dartz.dart';
import 'package:netflix_clone_app/domain/core/failure/main_failure.dart';
import 'package:netflix_clone_app/domain/newAndHot/model/new_and_hot_resp.dart';

abstract class NewAndHotServices{
  
  Future<Either<MainFailure,NewAndHotResp>> getComingSoonData();

  Future<Either<MainFailure,NewAndHotResp>> getEveryoneWatchingData();
}