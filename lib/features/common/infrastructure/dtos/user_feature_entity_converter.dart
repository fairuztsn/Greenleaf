// ignore_for_file: public_member_api_docs

import 'package:greenleaf/features/common/domain/entities/user_feature_entity.dart';

class UserFeaturesEntityConverter {
  static List<UserFeaturesEntity> toList(dynamic data) =>
      (data as List<dynamic>)
          .map((e) => UserFeaturesEntity.fromJson(e as Map<String, dynamic>))
          .toList();

  static UserFeaturesEntity toSingle(dynamic data) =>
      UserFeaturesEntity.fromJson((data as List).first as Map<String, dynamic>);
}
