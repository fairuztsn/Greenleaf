import 'package:flutter/material.dart';
import 'package:greenleaf/views/home/home.dart';
import 'package:greenleaf/views/profile/profile.dart';
import 'package:greenleaf/views/tanya/tanya.dart';

class ScreenIndex {
  List<Widget> buildPageView() {
    return const [HomePage(), TanyaScreen(), ProfileScreen()];
  }
}
