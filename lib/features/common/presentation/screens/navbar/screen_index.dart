// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:greenleaf/features/common/presentation/screens/home/home.dart';
import 'package:greenleaf/features/common/presentation/screens/profile/profile.dart';
import 'package:greenleaf/features/common/presentation/screens/tanya/tanya.dart';

class ScreenIndex {
  List<Widget> buildPageView() {
    return const [HomePage(), TanyaScreen(), ProfileScreen()];
  }
}
