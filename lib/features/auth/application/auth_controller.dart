import 'package:greenleaf/core/core.dart';
import 'package:greenleaf/features/auth/auth_provider.dart';
import 'package:greenleaf/features/auth/domain/entities/user_entity.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:uni_links/uni_links.dart';

part 'auth_controller.g.dart';

/// State controller for authentication

@riverpod
class AuthController extends _$AuthController {
  @override
  FutureOr<UserEntity?> build() async {
    print('power');
    final repository = ref.watch(authRepositoryProvider);
    print('pwoer');
    final res = await repository.restoreSession();
    final userEntity = res.fold((l) => null, (r) => r);
    _updateAuthState(userEntity);
    if (userEntity == null) {
      /// try to create session from deep link
      await _handleInitialDeepLink();
    }

    /// listen to auth changes
    repository.authStateChange((user) {
      state = AsyncData(user);
      _updateAuthState(userEntity);
    });
    return userEntity;
    // TODO(vh): how to cancel subscription override dispose
  }

  void _updateAuthState(UserEntity? userEntity) {
    authStateListenable.value = userEntity != null;
  }

  ///
  Future<void> _handleInitialDeepLink() async {
    state = const AsyncLoading();
    final initialLink = await getInitialLink();
    if (!(initialLink?.contains('refresh_token=') ?? false)) {
      return;
    }

    final refreshTokenQueryParam = initialLink
        ?.split('&')
        .firstWhere((element) => element.contains('refresh_token'));

    final refreshToken = refreshTokenQueryParam
        ?.substring(refreshTokenQueryParam.indexOf('=') + 1);
    if (refreshToken == null) return;

    final res = await ref.read(authRepositoryProvider).setSession(refreshToken);
    final userEntity = res.fold((l) => null, (r) => r);
    _updateAuthState(userEntity);
    state = AsyncData(userEntity);
  }

  ///
  FutureVoid signInWithEmailPassword({
    required String email,
    required String password,
  }) async {
    try {
      print('what happen2');
      final res = await ref
          .read(authRepositoryProvider)
          .signInWithEmailPass(email: email, password: password);
      res.fold(
        (l) => null,
        (r) => state = AsyncData(UserEntity.fromJson(r.user!.toJson())),
      );
    } catch (e) {
      return;
    }
  }

  /// Signs out user
  Future<void> signOut() async {
    await ref.read(authRepositoryProvider).signOut();
  }
}
