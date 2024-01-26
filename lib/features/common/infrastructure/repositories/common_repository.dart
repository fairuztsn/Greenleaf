// ignore_for_file: public_member_api_docs

import 'package:fpdart/fpdart.dart';
import 'package:greenleaf/core/type_def.dart';
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
  final User? user;

  static const String _tableProfile = 'ad_profile_data';
  static const String _tableFaq = 'ad_faq';
  static const String _tableFeature = 'ad_feature';
  // static const String _tableRole = 'ad_role';

  @override
  FutureEither<List<UserFAQEntity>> getFAQs() async {
    try {
      final res = await client
          .from(_tableFaq)
          .select()
          .eq('role_id', 1)
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
          .select()
          .eq('role_id', 1)
          .withConverter(UserFeaturesEntityConverter.toList);
      return right(res);
    } catch (e) {
      return left(Failure.unprocessableEntity(message: e.toString()));
    }
  }

  @override
  FutureEither<UserProfileEntity> getProfile() async {
    try {
      final res = await client
          .from(_tableProfile)
          .select()
          .eq('user_id', user!.id)
          .withConverter(UserProfileEntityConverter.toSingle);
      return right(res);
    } catch (e) {
      return left(Failure.unprocessableEntity(message: e.toString()));
    }
  }
}
