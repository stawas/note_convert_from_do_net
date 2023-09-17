// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'about_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AboutModel _$$_AboutModelFromJson(Map<String, dynamic> json) =>
    _$_AboutModel(
      title: json['title'] as String,
      version: json['version'] as String,
      moreInfoUrl: json['moreInfoUrl'] as String,
      message: json['message'] as String,
    );

Map<String, dynamic> _$$_AboutModelToJson(_$_AboutModel instance) =>
    <String, dynamic>{
      'title': instance.title,
      'version': instance.version,
      'moreInfoUrl': instance.moreInfoUrl,
      'message': instance.message,
    };
