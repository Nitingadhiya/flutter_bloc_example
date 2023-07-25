// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feed_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FeedModel _$FeedModelFromJson(Map<String, dynamic> json) => FeedModel(
      id: json['id'] as int,
      description: json['description'] as String?,
      type: json['type'] as int,
      profileId: json['profile_id'] as int,
      profileImageUrl: json['profile_image_url'] as String?,
      name: json['name'] as String,
      files: (json['files'] as List<dynamic>?)
          ?.map((e) => PostFileModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      likesCount: json['likes_count'] as int? ?? 0,
      commentsCount: json['comments_count'] as int? ?? 0,
      updatedAt: json['updated_at'] as String?,
      dateTime: json['date_time'] as String,
      isLiked: json['is_liked'] as bool? ?? false,
      linkMeta: json['link_meta'] as String?,
      aspectRatio: (json['aspect_ratio'] as num?)?.toDouble(),
      isEdited: json['is_edited'] as bool? ?? false,
      viewCount: json['view_count'] as int? ?? 0,
      userWorkArea: json['user_work_area'] as String?,
      userCity: json['user_city'] as String?,
    );

Map<String, dynamic> _$FeedModelToJson(FeedModel instance) => <String, dynamic>{
      'id': instance.id,
      'description': instance.description,
      'type': instance.type,
      'profile_id': instance.profileId,
      'profile_image_url': instance.profileImageUrl,
      'name': instance.name,
      'files': instance.files,
      'likes_count': instance.likesCount,
      'comments_count': instance.commentsCount,
      'updated_at': instance.updatedAt,
      'date_time': instance.dateTime,
      'is_liked': instance.isLiked,
      'link_meta': instance.linkMeta,
      'aspect_ratio': instance.aspectRatio,
      'is_edited': instance.isEdited,
      'view_count': instance.viewCount,
      'user_work_area': instance.userWorkArea,
      'user_city': instance.userCity,
    };
