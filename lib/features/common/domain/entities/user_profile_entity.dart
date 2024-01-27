// ignore_for_file: public_member_api_docs

import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_profile_entity.freezed.dart';
part 'user_profile_entity.g.dart';

@freezed
class UserProfileEntity with _$UserProfileEntity {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory UserProfileEntity({
    required int id,
    required String userId,
    required String firstName,
    required String lastName,
    required String email,
    required String phoneNumber,
    required int roleId,
    @JsonKey(includeIfNull: false) String? homeStreet,
    @JsonKey(includeIfNull: false) String? homeCity,
    @JsonKey(includeIfNull: false) String? homeProvince,
    @JsonKey(includeIfNull: false) String? photoProfile,
    @JsonKey(includeIfNull: false) String? privilegeId,
  }) = _UserProfileEntity;

  factory UserProfileEntity.fromJson(Map<String, dynamic> json) =>
      _$UserProfileEntityFromJson(json);
}
