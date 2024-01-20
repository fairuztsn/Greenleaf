// ignore_for_file: inference_failure_on_untyped_parameter

import 'package:greenleaf/features/common/domain/entities/user_faq_entity.dart';
import 'package:greenleaf/features/common/domain/failures/failure.dart';
import 'package:greenleaf/features/common/providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_faq_controller.g.dart';

@riverpod

///
class UserFAQController extends _$UserFAQController {
  @override
  FutureOr<List<UserFAQEntity>> build() async {
    final res = await ref.watch(commonRepositoryProvider).getFAQs();
    return res.fold(
      (l) => throw Failure.unprocessableEntity(message: l.toString()),
      (r) => r,
    );
  }
}
