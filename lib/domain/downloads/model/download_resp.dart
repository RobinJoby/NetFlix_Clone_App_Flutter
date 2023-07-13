import 'package:json_annotation/json_annotation.dart';


part 'download_resp.g.dart';

@JsonSerializable()
class DownloadResp {

	@JsonKey(name: 'results') 
	List<DownloadResultData> results;
	

	DownloadResp({
		
		this.results = const[], 
		
	});

	factory DownloadResp.fromJson(Map<String, dynamic> json) {
		return _$DownloadRespFromJson(json);
	}

	Map<String, dynamic> toJson() => _$DownloadRespToJson(this);
}

@JsonSerializable()
class DownloadResultData {

  @JsonKey(name: 'id')
  int? id;

  @JsonKey(name: 'title')
  String? title;

  @JsonKey(name: 'poster_path')
  String? posterPath;

  DownloadResultData({
    this.id,
    this.title,
    this.posterPath,
  });

  factory DownloadResultData.fromJson(Map<String, dynamic> json) {
    return _$DownloadResultDataFromJson(json);
  }

  Map<String, dynamic> toJson() => _$DownloadResultDataToJson(this);
}
