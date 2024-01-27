// ignore_for_file: inference_failure_on_untyped_parameter

import 'package:greenleaf/features/common/domain/entities/user_feature_entity.dart';
import 'package:greenleaf/features/common/domain/failures/failure.dart';
import 'package:greenleaf/features/common/providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_feature_controller.g.dart';

@riverpod

///
class UserFeatureController extends _$UserFeatureController {
  @override
  FutureOr<List<UserFeaturesEntity>> build() async {
    final res = await ref.read(commonRepositoryProvider).getFeatures();
    return res.fold(
      (l) => throw Failure.unprocessableEntity(message: l.toString()),
      (r) => r,
    );
  }
}
