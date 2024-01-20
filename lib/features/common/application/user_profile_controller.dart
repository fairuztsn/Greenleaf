// ignore_for_file: inference_failure_on_untyped_parameter

import 'package:greenleaf/features/common/domain/entities/user_profile_entity.dart';
import 'package:greenleaf/features/common/domain/failures/failure.dart';
import 'package:greenleaf/features/common/providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_profile_controller.g.dart';

@riverpod

///
class UserProfileController extends _$UserProfileController {
  @override
  FutureOr<UserProfileEntity> build() async {
    final res = await ref.watch(commonRepositoryProvider).getProfile();
    return res.fold(
      (l) => throw Failure.unprocessableEntity(message: l.toString()),
      (r) => r,
    );
  }
}
