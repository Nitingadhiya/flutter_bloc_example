import 'package:flutter_bloc_example/domain/entities/feed.dart';
import 'package:json_annotation/json_annotation.dart';

part 'post_file_model.g.dart';

@JsonSerializable()
class PostFileModel extends PostFileEntities {
  PostFileModel({
    required super.id,
    required super.url,
    super.thumbnailUrl,
    required super.type,
    super.height,
    super.width,
    super.localFile,
  });

  factory PostFileModel.fromJson(Map<String, dynamic> json) => _$PostFileModelFromJson(json);

  Map<String, dynamic> toJson() => _$PostFileModelToJson(this);
}
