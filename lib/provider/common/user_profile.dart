import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:greenleaf/controller/auth_controller.dart';
import 'package:greenleaf/models/ad_profile.dart';
import 'package:greenleaf/provider/common/session_user.dart';

final userProfileProvider = StateProvider<UserProfile>((ref) {
  final currentUser = ref.watch(userDataProvider);
  ref
      .read(authControllerProvider.notifier)
      .getUsersData(uid: currentUser!.id, role: 1);
  return ref.watch(authControllerProvider);
});

final workerProfileProvider = StateProvider<UserProfile>((ref) {
  final currentUser = ref.watch(userDataProvider);
  ref
      .read(authControllerProvider.notifier)
      .getUsersData(uid: currentUser!.id, role: 2);
  return ref.watch(authControllerProvider);
});
