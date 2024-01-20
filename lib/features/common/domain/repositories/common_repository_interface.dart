// ignore_for_file: public_member_api_docs

import 'package:greenleaf/core/core.dart';
import 'package:greenleaf/features/common/domain/entities/user_faq_entity.dart';
import 'package:greenleaf/features/common/domain/entities/user_feature_entity.dart';
import 'package:greenleaf/features/common/domain/entities/user_profile_entity.dart';

abstract class CommonRepositoryInterface {
  FutureEither<UserProfileEntity> getProfile();

  FutureEither<List<UserFeaturesEntity>> getFeatures();

  FutureEither<List<UserFAQEntity>> getFAQs();
}
