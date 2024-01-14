// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:greenleaf/core/core.dart';
import 'package:greenleaf/models/ad_profile.dart';
import 'package:greenleaf/utils/snackbar.dart';
import 'package:greenleaf/views/navbar/navbar.dart';
import 'package:supabase_flutter/supabase_flutter.dart';


class AuthController extends StateNotifier<UserProfile> {
  AuthController() : super(const UserProfile());

  FutureVoid emailPassSignIn({required BuildContext context, required String email, required String password}) async {
    final supabase = Supabase.instance.client;
    try {
      var credential = await supabase.auth.signInWithPassword(email: email, password: password);
      final User? user = credential.user;
      if (user != null) {
        var getUsers = await supabase.from("ad_profile_data").select("*, ad_role!inner(nama_role), ad_privilege!inner(privilege_name)").eq("user_id", credential.user!.id).eq('ad_profile_data.role', 'ad_role.id').eq('ad_profile_data.privilege', 'ad_privilege.id');
        if (getUsers.isEmpty) {
          return;
        } else {
          final userProfile = UserProfile.fromMap(getUsers.first);
          state = userProfile;
        }
        if (!mounted) return;
        Snackbars.showSuccessSnackbar(
            context, title: "Login Success", message: "Welcome to GreenLeaf");
        Navigator.of(context).popUntil((route) => route.isFirst);
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const Navbar(),
            ));

      }
    } on PostgrestException catch (e) {
      Snackbars.showFailedSnackbar(context,title: "Login Failed", message: e.toString());
    } 
  }
}

final authControllerProvider = StateNotifierProvider<AuthController, UserProfile>((ref) =>
  AuthController(),
);