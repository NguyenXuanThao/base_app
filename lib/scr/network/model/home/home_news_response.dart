import 'package:json_annotation/json_annotation.dart';

part 'home_news_response.g.dart';

@JsonSerializable()
class HomeNewsResponse {
  @JsonKey(name: 'id')
  final int? id;
  @JsonKey(name: 'title')
  final String? title;
  @JsonKey(name: 'url_image')
  final String? urlImage;
  @JsonKey(name: 'summary')
  final String? summary;
  @JsonKey(name: 'content')
  final String? content;

  HomeNewsResponse({
    this.id,
    this.title,
    this.urlImage,
    this.summary,
    this.content,
  });

  factory HomeNewsResponse.fromJson(Map<String, dynamic> json) =>
      _$HomeNewsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$HomeNewsResponseToJson(this);
}