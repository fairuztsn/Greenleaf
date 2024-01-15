import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:greenleaf/core/core.dart';
import 'package:greenleaf/models/ad_profile.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthController extends StateNotifier<UserProfile> {
  AuthController() : super(const UserProfile());
  final supabase = Supabase.instance.client;
  FutureVoid emailPassUserSignIn(
      {required String email, required String password}) async {
    var credential = await supabase.auth
        .signInWithPassword(email: email, password: password);
    final User? user = credential.user;
    if (user != null) {
      var getUsers = await supabase
          .from("ad_profile_data")
          .select("*, ad_role!inner(nama_role)")
          .eq("user_id", credential.user!.id)
          .eq('ad_profile_data.role', 'ad_role.id')
          .eq('ad_profile_data.role', 1);
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

  // FutureVoid emailPassPartnerSignIn(
  //     {required String email, required String password}) async {
  //   var credential = await supabase.auth
  //       .signInWithPassword(email: email, password: password);
  //   final User? user = credential.user;
  //   if (user != null) {
  //     var getUsers = await supabase
  //         .from("ad_profile_data")
  //         .select("*, ad_role!inner(nama_role)")
  //         .eq("user_id", credential.user!.id)
  //         .eq('ad_profile_data.role', 'ad_role.id');
  //     if (getUsers.isEmpty) {
  //       return;
  //     } else {
  //       final userProfile = UserProfile.fromMap(getUsers.first);
  //       await supabase
  //           .from('ad_login_history')
  //           .insert({'user_id': user.id, 'last_logged_in': DateTime.now()});
  //       state = userProfile;
  //     }
  //   }
  // }

  FutureVoid emailPassWorkerSignIn(
      {required String email, required String password}) async {
    var credential = await supabase.auth
        .signInWithPassword(email: email, password: password);
    final User? user = credential.user;
    if (user != null) {
      var getUsers = await supabase
          .from("ad_profile_data")
          .select("*, ad_role!inner(nama_role)")
          .eq("user_id", credential.user!.id)
          .eq('ad_profile_data.role', 'ad_role.id')
          .eq('ad_profile_data.role', 2);
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

  FutureVoid emailPassUserSignUp(
      {required String email,
      required String password,
      required UserProfile userProfile}) async {
    var credential =
        await supabase.auth.signUp(email: email, password: password);
    final User? user = credential.user;
    if (user != null) {
      var getUsers = await supabase
          .from("ad_profile_data")
          .select("*, ad_role!inner(nama_role)")
          .eq("user_id", credential.user!.id)
          .eq('ad_profile_data.role', 'ad_role.id')
          .eq('ad_profile_data.role', 1);
      if (getUsers.isEmpty) {
        final List<Map<String, dynamic>> data =
            await supabase.from("ad_profile_data").insert({
          'user_id': user.id,
          'first_name': userProfile.firstName,
          'last_name': userProfile.lastName,
          'email': userProfile.email,
          'phone_number': userProfile.phoneNumber,
          'role': 1
        }).select();
        UserProfile userData = UserProfile.fromMap(data.first);
        state = userData;
      }
    }
  }
}

final authControllerProvider =
    StateNotifierProvider<AuthController, UserProfile>(
  (ref) => AuthController(),
);
