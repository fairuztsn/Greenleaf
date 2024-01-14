import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:greenleaf/core/core.dart';
import 'package:greenleaf/models/ad_profile.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthController extends StateNotifier<UserProfile> {
  AuthController() : super(const UserProfile());

  FutureVoid emailPassSignIn(
      {required String email, required String password}) async {
    final supabase = Supabase.instance.client;
    var credential = await supabase.auth
        .signInWithPassword(email: email, password: password);
    final User? user = credential.user;
    if (user != null) {
      var getUsers = await supabase
          .from("ad_profile_data")
          .select("*, ad_role!inner(nama_role)")
          .eq("user_id", credential.user!.id)
          .eq('ad_profile_data.role', 'ad_role.id');
      if (getUsers.isEmpty) {
        return;
      } else {
        final userProfile = UserProfile.fromMap(getUsers.first);
        await supabase
            .from('ad_login_history')
            .insert({'user_id': user.id, 'last_logged_in': DateTime.now()});
        state = userProfile;
      }
    }
  }
}

final authControllerProvider =
    StateNotifierProvider<AuthController, UserProfile>(
  (ref) => AuthController(),
);
