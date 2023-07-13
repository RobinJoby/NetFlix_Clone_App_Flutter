import 'package:dartz/dartz.dart';
import 'package:netflix_clone_app/domain/core/failure/main_failure.dart';
import 'package:netflix_clone_app/domain/downloads/model/download_resp.dart';

abstract class DownloadServices{
  Future<Either<MainFailure,DownloadResp>> getDownloadImages();
}