import 'package:greenleaf/config/providers.dart';
import 'package:greenleaf/features/auth/auth_provider.dart';
import 'package:greenleaf/features/common/domain/entities/user_profile_entity.dart';
import 'package:greenleaf/features/common/domain/failures/failure.dart';
import 'package:greenleaf/features/common/infrastructure/repositories/common_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'providers.g.dart';

@riverpod

///
CommonRepository commonRepository(CommonRepositoryRef ref) {
  final user =
      ref.watch(authRepositoryProvider.select((value) => value.currentUser));
  if (user == null) throw const Failure.unauthorized();
  return CommonRepository(
    client: ref.watch(supabaseClientProvider),
    user: user,
  );
}

@riverpod
class CurrentProfile extends _$CurrentProfile {
  @override
  UserProfileEntity? build() {
    return null;
  }

  UserProfileEntity? get prof => state;

  set prof(UserProfileEntity? entity) {
    state = entity;
  }
}
