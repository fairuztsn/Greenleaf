// ignore_for_file: public_member_api_docs

import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_faq_entity.freezed.dart';
part 'user_faq_entity.g.dart';

@freezed
class UserFAQEntity with _$UserFAQEntity {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory UserFAQEntity({
    required int id,
    required String question,
    required String subquestion,
    required String answer,
    required int roleId,
  }) = _UserFAQEntity;

  factory UserFAQEntity.fromJson(Map<String, dynamic> json) =>
      _$UserFAQEntityFromJson(json);
}
