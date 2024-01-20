// ignore_for_file: public_member_api_docs

import 'package:greenleaf/features/common/domain/entities/user_faq_entity.dart';

class UserFAQEntityConverter {
  static List<UserFAQEntity> toList(dynamic data) => (data as List<dynamic>)
      .map((e) => UserFAQEntity.fromJson(e as Map<String, dynamic>))
      .toList();

  static UserFAQEntity toSingle(dynamic data) => UserFAQEntity.fromJson(
        (data as List).first as Map<String, dynamic>,
      );
}
