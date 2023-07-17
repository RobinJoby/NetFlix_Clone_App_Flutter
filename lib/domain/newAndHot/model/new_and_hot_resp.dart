import 'package:json_annotation/json_annotation.dart';

part 'new_and_hot_resp.g.dart';

@JsonSerializable()
class NewAndHotResp {
	
  @JsonKey(name: 'page')
	int? page;

  @JsonKey(name: 'results')
	List<NewAndHotResultData> results;
	

	NewAndHotResp({
		
		this.page, 
		this.results = const[], 
		
	});

	factory NewAndHotResp.fromJson(Map<String, dynamic> json) {
		return _$NewAndHotRespFromJson(json);
	}

	Map<String, dynamic> toJson() => _$NewAndHotRespToJson(this);
}


@JsonSerializable()
class NewAndHotResultData {
	
	@JsonKey(name: 'backdrop_path') 
	String? backdropPath;

	@JsonKey(name: 'id')
	int? id;

	@JsonKey(name: 'original_language') 
	String? originalLanguage;

	@JsonKey(name: 'original_title') 
	String? originalTitle;

  @JsonKey(name: 'overview')
	String? overview;


	@JsonKey(name: 'poster_path') 
	String? posterPath;

	@JsonKey(name: 'release_date') 
	String? releaseDate;

  @JsonKey(name: 'title')
	String? title;

	

	NewAndHotResultData({

		this.backdropPath, 
		this.id, 
		this.originalLanguage, 
		this.originalTitle, 
		this.overview, 
		this.posterPath, 
		this.releaseDate, 
		this.title, 
	
	});

	factory NewAndHotResultData.fromJson(Map<String, dynamic> json) {
		return _$NewAndHotResultDataFromJson(json);
	}

	Map<String, dynamic> toJson() => _$NewAndHotResultDataToJson(this);
}