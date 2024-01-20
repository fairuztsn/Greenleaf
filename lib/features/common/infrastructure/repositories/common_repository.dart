// ignore_for_file: public_member_api_docs

import 'package:fpdart/fpdart.dart';
import 'package:greenleaf/core/type_def.dart';
import 'package:greenleaf/features/auth/domain/entities/user_entity.dart';
import 'package:greenleaf/features/common/domain/entities/user_faq_entity.dart';
import 'package:greenleaf/features/common/domain/entities/user_feature_entity.dart';
import 'package:greenleaf/features/common/domain/entities/user_profile_entity.dart';
import 'package:greenleaf/features/common/domain/failures/failure.dart';
import 'package:greenleaf/features/common/domain/repositories/common_repository_interface.dart';
import 'package:greenleaf/features/common/infrastructure/dtos/user_faq_entity_converter.dart';
import 'package:greenleaf/features/common/infrastructure/dtos/user_feature_entity_converter.dart';
import 'package:greenleaf/features/common/infrastructure/dtos/user_profile_entity_converter.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class CommonRepository implements CommonRepositoryInterface {
  CommonRepository({required this.client, required this.user});

  final SupabaseClient client;
  final UserEntity user;

  static const String _tableProfile = 'ad_profile_data';
  static const String _tableFaq = 'ad_faq';
  static const String _tableFeature = 'ad_feature';
  static const String _tableRole = 'ad_role';

  @override
  FutureEither<List<UserFAQEntity>> getFAQs() async {
    try {
      final res = await client
          .from(_tableFaq)
          .select('*, $_tableRole!inner(*)')
          .eq('$_tableRole.id', '$_tableFaq.role_id')
          .withConverter(UserFAQEntityConverter.toList);
      return right(res);
    } catch (_) {
      return left(const Failure.badRequest());
    }
  }

  @override
  FutureEither<List<UserFeaturesEntity>> getFeatures() async {
    try {
      final res = await client
          .from(_tableFeature)
          .select('*, $_tableRole!inner(*)')
          .eq('$_tableRole.id', '$_tableFeature.role_id')
          .withConverter(UserFeaturesEntityConverter.toList);
      return right(res);
    } catch (_) {
      return left(const Failure.badRequest());
    }
  }

  @override
  FutureEither<UserProfileEntity> getProfile() async {
    try {
      final res = await client
          .from(_tableProfile)
          .select('*, $_tableRole!inner(*)')
          .eq('$_tableRole.id', '$_tableProfile.role_id')
          .eq('$_tableProfile.user_id', user.id)
          .withConverter(UserProfileEntityConverter.toSingle);
      return right(res);
    } catch (_) {
      return left(const Failure.badRequest());
    }
  }
}
