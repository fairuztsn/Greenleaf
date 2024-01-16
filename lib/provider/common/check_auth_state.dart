import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:greenleaf/provider/common/session_user.dart';
import 'package:greenleaf/provider/common/user_profile.dart';
import 'package:greenleaf/views/navbar/navbar.dart';
import 'package:greenleaf/views/onboarding/onboarding.dart';
import 'package:page_transition/page_transition.dart';

final checkAuthStateProvider =
    StateProvider.family<bool, BuildContext>((ref, context) {
  final userResult = ref.watch(userDataProvider);
  final sessionResult = ref.watch(sessionDataProvider);
  if (userResult == null && sessionResult == null) {
    ref.invalidate(userProfileProvider);
    Navigator.pushReplacement(
        context,
        PageTransition(
            child: const OnBoardingScreen(), type: PageTransitionType.fade));
    return false;
  } else {
    ref.read(userProfileProvider);
    Navigator.pushReplacement(context,
        PageTransition(child: const Navbar(), type: PageTransitionType.fade));
    return true;
  }
});
