import 'package:flutter_bloc_example/data/models/post_file_model.dart';
import 'package:flutter_bloc_example/domain/entities/login.dart';
import 'package:json_annotation/json_annotation.dart';
import '../../domain/entities/feed.dart';

part 'feed_model.g.dart';

@JsonSerializable()
class FeedModel extends FeedEntities {
  FeedModel({
    required super.id,
    super.description,
    required super.type,
    required super.profileId,
    super.profileImageUrl,
    required super.name,
    super.files,
    required super.likesCount,
    required super.commentsCount,
    super.updatedAt,
    required super.dateTime,
    required super.isLiked,
    //required super.isReported,
    super.linkMeta,
    super.aspectRatio,
    required super.isEdited,
    required super.viewCount,
    super.userWorkArea,
    super.userCity,
  });

  // instead of below line use above
  // const FeedModel({required String authToken}) : super(authToken: authToken);

  //Convert json to dart object
  factory FeedModel.fromJson(Map<String, dynamic> json) {
    return _$FeedModelFromJson(json);
    // return FeedModel(authToken: json['data']['token']);
  }

  // only show the dart object to convert to json
  Map<String, dynamic> toJson() {
    return _$FeedModelToJson(this);
  }
}
