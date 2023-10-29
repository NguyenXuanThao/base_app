import 'package:json_annotation/json_annotation.dart';

part 'home_banner_response.g.dart';

@JsonSerializable()
class HomeBannerResponse {
  @JsonKey(name: 'id')
  final int? id;
  @JsonKey(name: 'url_image')
  final String? urlImage;

  HomeBannerResponse({
    this.id,
    this.urlImage,
  });

  factory HomeBannerResponse.fromJson(Map<String, dynamic> json) =>
      _$HomeBannerResponseFromJson(json);

  Map<String, dynamic> toJson() => _$HomeBannerResponseToJson(this);
}