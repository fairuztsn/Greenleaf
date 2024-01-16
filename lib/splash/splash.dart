import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:greenleaf/provider/common/check_auth_state.dart';
import 'package:greenleaf/shared/base.dart';

class Splash extends ConsumerStatefulWidget {
  const Splash({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SplashState();
}

class _SplashState extends ConsumerState<Splash> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(checkAuthStateProvider(context));
    });
  }

  @override
  Widget build(BuildContext context) {
    return BaseApp.standardBackground(
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircularProgressIndicator.adaptive(),
            SizedBox(
              height: 5,
            ),
            Text(
              "Loading....",
              style: TextStyle(fontSize: 8, fontWeight: FontWeight.w800),
            )
          ],
        ),
      ),
    );
  }
}
