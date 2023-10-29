// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_general_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomeGeneralResponse _$HomeGeneralResponseFromJson(Map<String, dynamic> json) =>
    HomeGeneralResponse(
      banner: (json['banner'] as List<dynamic>?)
          ?.map((e) => HomeBannerResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      news: (json['news'] as List<dynamic>?)
          ?.map((e) => HomeNewsResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$HomeGeneralResponseToJson(
        HomeGeneralResponse instance) =>
    <String, dynamic>{
      'banner': instance.banner,
      'news': instance.news,
    };
