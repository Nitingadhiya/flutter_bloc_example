// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_file_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostFileModel _$PostFileModelFromJson(Map<String, dynamic> json) =>
    PostFileModel(
      id: json['id'] as int,
      url: json['url'] as String,
      thumbnailUrl: json['thumbnail_url'] as String?,
      type: json['type'] as String,
      height: json['height'] as String?,
      width: json['width'] as String?,
      localFile: json['local_file'] as String?,
    );

Map<String, dynamic> _$PostFileModelToJson(PostFileModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'url': instance.url,
      'thumbnail_url': instance.thumbnailUrl,
      'type': instance.type,
      'height': instance.height,
      'width': instance.width,
      'local_file': instance.localFile,
    };
