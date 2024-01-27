// ignore_for_file: public_member_api_docs

import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_feature_entity.freezed.dart';
part 'user_feature_entity.g.dart';

@freezed
class UserFeaturesEntity with _$UserFeaturesEntity {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory UserFeaturesEntity({
    required int id,
    required String name,
    required String groupFeature,
    required String mobilePath,
    required int roleId,
    required String iconFeature,
  }) = _UserFeaturesEntity;

  factory UserFeaturesEntity.fromJson(Map<String, dynamic> json) =>
      _$UserFeaturesEntityFromJson(json);
}
