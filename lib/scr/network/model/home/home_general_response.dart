import 'package:base_app/scr/network/model/home/home_banner_response.dart';
import 'package:base_app/scr/network/model/home/home_news_response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'home_general_response.g.dart';

@JsonSerializable()
class HomeGeneralResponse {
  @JsonKey(name: 'banner')
  final List<HomeBannerResponse>? banner;
  @JsonKey(name: 'news')
  final List<HomeNewsResponse>? news;

  HomeGeneralResponse({
    this.banner,
    this.news,
  });

  factory HomeGeneralResponse.fromJson(Map<String, dynamic> json) =>
      _$HomeGeneralResponseFromJson(json);

  Map<String, dynamic> toJson() => _$HomeGeneralResponseToJson(this);
}
