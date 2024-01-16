import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:greenleaf/shared/const.dart';
import 'package:greenleaf/views/navbar/screen_index.dart';

class Navbar extends ConsumerStatefulWidget {
  const Navbar({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _NavbarState();
}

class _NavbarState extends ConsumerState<Navbar> {
  late PageController _pageController;
  int selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: selectedIndex);
  }

  void onButtonPressed(int index) {
    setState(() {
      selectedIndex = index;
    });
    _pageController.animateToPage(selectedIndex,
        duration: const Duration(milliseconds: 500), curve: Curves.easeOutQuad);
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
          systemNavigationBarColor: Colors.white,
          systemNavigationBarIconBrightness: Brightness.dark),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          body: PageView(
            physics: const NeverScrollableScrollPhysics(),
            controller: _pageController,
            children: ScreenIndex().buildPageView(),
          ),
          bottomNavigationBar: DecoratedBox(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    offset: const Offset(0, -10),
                    blurRadius: 8.0)
              ],
            ),
            child: GNav(
                backgroundColor: Constants.colorGreenLeaf,
                haptic: true,
                tabBorderRadius: 15, // tab button shadow
                curve: Curves.easeOutExpo, // tab animation curves
                duration:
                    const Duration(milliseconds: 50), // tab animation duration
                gap: 2, // the tab button gap between icon and text
                color: Colors.white38, // unselected icon color
                activeColor: Colors.white, // selected icon and text color
                iconSize: 24, // tab button icon size
                tabBackgroundColor: Colors.purple
                    .withOpacity(0.1), // selected tab background color
                padding: const EdgeInsets.symmetric(
                    horizontal: 20, vertical: 5), // navigation bar padding
                tabs: const [
                  GButton(
                    margin: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                    icon: Icons.home,
                    text: 'Beranda',
                  ),
                  GButton(
                    margin: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                    icon: Icons.question_mark_rounded,
                    text: 'Tanya',
                  ),
                  GButton(
                    margin: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                    icon: Icons.person,
                    text: 'Profilku',
                  )
                ],
                selectedIndex: selectedIndex,
                onTabChange: onButtonPressed),
          ),
        ),
      ),
    );
  }
}
