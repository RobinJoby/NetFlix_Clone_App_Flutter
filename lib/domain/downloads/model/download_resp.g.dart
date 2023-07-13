// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'download_resp.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DownloadResp _$DownloadRespFromJson(Map<String, dynamic> json) => DownloadResp(
      results: (json['results'] as List<dynamic>?)
              ?.map(
                  (e) => DownloadResultData.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$DownloadRespToJson(DownloadResp instance) =>
    <String, dynamic>{
      'results': instance.results,
    };

DownloadResultData _$DownloadResultDataFromJson(Map<String, dynamic> json) =>
    DownloadResultData(
      id: json['id'] as int?,
      title: json['title'] as String?,
      posterPath: json['poster_path'] as String?,
    );

Map<String, dynamic> _$DownloadResultDataToJson(DownloadResultData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'poster_path': instance.posterPath,
    };
