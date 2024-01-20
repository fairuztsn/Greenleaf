// ignore_for_file: public_member_api_docs

import 'package:greenleaf/features/common/domain/entities/user_profile_entity.dart';

class UserProfileEntityConverter {
  static List<UserProfileEntity> toList(dynamic data) {
    return (data as List<dynamic>)
        .map((e) => UserProfileEntity.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  static UserProfileEntity toSingle(dynamic data) {
    return UserProfileEntity.fromJson(
      (data as List).first as Map<String, dynamic>,
    );
  }
}
