import 'package:greenleaf/config/providers.dart';
import 'package:greenleaf/features/common/domain/entities/user_profile_entity.dart';
import 'package:greenleaf/features/common/infrastructure/repositories/common_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'providers.g.dart';

@riverpod

///
CommonRepository commonRepository(CommonRepositoryRef ref) {
  final user = ref.watch(supabaseClientProvider).auth;
  return CommonRepository(
    client: ref.watch(supabaseClientProvider),
    user: user.currentUser,
  );
}

@riverpod

///
class CurrentProfile extends _$CurrentProfile {
  @override
  UserProfileEntity? build() {
    return null;
  }

  ///
  UserProfileEntity? get prof => state;

  set prof(UserProfileEntity? entity) {
    state = entity;
  }
}
