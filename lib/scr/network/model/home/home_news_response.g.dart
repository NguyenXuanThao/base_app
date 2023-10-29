// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_news_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomeNewsResponse _$HomeNewsResponseFromJson(Map<String, dynamic> json) =>
    HomeNewsResponse(
      id: json['id'] as int?,
      title: json['title'] as String?,
      urlImage: json['url_image'] as String?,
      summary: json['summary'] as String?,
      content: json['content'] as String?,
    );

Map<String, dynamic> _$HomeNewsResponseToJson(HomeNewsResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'url_image': instance.urlImage,
      'summary': instance.summary,
      'content': instance.content,
    };
