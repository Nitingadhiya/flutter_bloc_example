// API response

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc_example/data/models/post_file_model.dart';
import 'package:json_annotation/json_annotation.dart';

class FeedEntities extends Equatable {
  int id;
  String? description;
  int type;
  @JsonKey(name: 'profile_id')
  int profileId;
  @JsonKey(name: 'profile_image_url')
  String? profileImageUrl;
  String name;
  List<PostFileModel>? files;
  @JsonKey(defaultValue: 0, name: 'likes_count')
  int likesCount;
  @JsonKey(defaultValue: 0, name: 'comments_count')
  int commentsCount;
  @JsonKey(name: 'updated_at')
  String? updatedAt;
  @JsonKey(name: 'date_time')
  String dateTime;
  @JsonKey(defaultValue: false, name: 'is_liked')
  bool isLiked;

  /*@JsonKey(defaultValue: false, name: 'is_reported')
  bool isReported;*/
  @JsonKey(name: 'link_meta')
  String? linkMeta;
  @JsonKey(name: 'aspect_ratio')
  double? aspectRatio;
  @JsonKey(name: 'is_edited', defaultValue: false)
  bool isEdited;
  @JsonKey(name: 'view_count', defaultValue: 0)
  int viewCount;
  @JsonKey(name: 'user_work_area')
  String? userWorkArea;
  @JsonKey(name: 'user_city')
  String? userCity;

  FeedEntities({
    required this.id,
    this.description,
    required this.type,
    required this.profileId,
    this.profileImageUrl,
    required this.name,
    this.files,
    required this.likesCount,
    required this.commentsCount,
    this.updatedAt,
    required this.dateTime,
    required this.isLiked,
    //required this.isReported,
    this.linkMeta,
    this.aspectRatio,
    required this.isEdited,
    required this.viewCount,
    this.userWorkArea,
    this.userCity,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
        id,
        description,
        type,
        profileId,
        profileImageUrl,
        name,
        files,
        likesCount,
        commentsCount,
        updatedAt,
        dateTime,
        isLiked,
        //isReported,
        linkMeta,
        aspectRatio,
        isEdited,
        viewCount,
        userWorkArea,
      ];
}

@JsonSerializable()
class PostFileEntities {
  int id;
  String url;
  @JsonKey(name: 'thumbnail_url')
  String? thumbnailUrl;
  String type;
  String? height;
  String? width;
  @JsonKey(name: 'local_file')
  String? localFile;

  PostFileEntities({
    required this.id,
    required this.url,
    this.thumbnailUrl,
    required this.type,
    this.height,
    this.width,
    this.localFile,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
        id,
        url,
        thumbnailUrl,
        type,
        height,
        width,
        localFile,
      ];
}
