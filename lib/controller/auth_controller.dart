import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:greenleaf/core/core.dart';
import 'package:greenleaf/models/ad_profile.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'dart:io';

class AuthController extends StateNotifier<UserProfile> {
  AuthController() : super(const UserProfile());
  final hostname = Platform.localHostname;

  final supabase = Supabase.instance.client;
  FutureVoid emailPassUserSignIn(
      {required String email, required String password}) async {
    final ipAddr =
        await InternetAddress.lookup(hostname, type: InternetAddressType.IPv4);

    var credential = await supabase.auth
        .signInWithPassword(email: email, password: password);
    final User? user = credential.user;
    if (user != null) {
      final data = await getUsersData(uid: user.id, role: 1);

      await supabase.from('ad_login_history').insert({
        'user_id': user.id,
        'last_logged_in': DateTime.now().toIso8601String(),
        'host_name': hostname,
        'ip': ipAddr.first.address
      });
      state = data;
    }
    return;
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
        await supabase.from('ad_login_history').insert({
          'user_id': user.id,
          'last_logged_in': DateTime.now().toIso8601String(),
          'host_name': hostname,
        });
        state = userProfile;
      }
    }
  }

  FutureVoid emailPassUserSignUp(
      {required String email,
      required String password,
      required UserProfile userProfile}) async {
    final ipAddr =
        await InternetAddress.lookup(hostname, type: InternetAddressType.IPv4);
    var credential =
        await supabase.auth.signUp(email: email, password: password);
    final User? user = credential.user;
    if (user != null) {
      UserProfile temp = userProfile.copyWith(userId: user.id);
      final Map<String, dynamic> data = await supabase
          .from("ad_profile_data")
          .insert(temp.toMap())
          .select()
          .single();
      UserProfile userData = UserProfile.fromMap(data);
      await supabase.from('ad_login_history').insert({
        'user_id': user.id,
        'last_logged_in': DateTime.now().toIso8601String(),
        'host_name': hostname,
        'ip': ipAddr.first.address
      });
      state = userData;
    }
  }

  FutureVoid emailPassWorkerSignUp(
      {required String email,
      required String password,
      required UserProfile userProfile}) async {
    final ipAddr =
        await InternetAddress.lookup(hostname, type: InternetAddressType.IPv4);
    var credential =
        await supabase.auth.signUp(email: email, password: password);
    final User? user = credential.user;
    if (user != null) {
      UserProfile temp = userProfile.copyWith(userId: user.id);
      final Map<String, dynamic> data = await supabase
          .from("ad_profile_data")
          .insert(temp.toMap())
          .select()
          .single();
      UserProfile userData = UserProfile.fromMap(data);
      await supabase.from('ad_login_history').insert({
        'user_id': user.id,
        'last_logged_in': DateTime.now().toIso8601String(),
        'host_name': hostname,
        'ip': ipAddr.first.address
      });
      state = userData;
    }
  }

  FutureVoid signOutAllUsers() async {
    final currentSession = supabase.auth.currentSession;
    final currentUser = supabase.auth.currentUser;
    if (currentSession == null && currentUser == null) {
      return;
    } else {
      await supabase.auth.signOut();
      state = const UserProfile(
          email: "",
          firstName: "",
          homeCity: "",
          homeProvince: "",
          homeStreet: "",
          id: null,
          lastName: "",
          phoneNumber: "",
          photoProfile: "",
          privilege: "",
          role: null,
          userId: "");
    }
  }

  Future<UserProfile> getUsersData(
      {required String uid, required int role}) async {
    final supabase = Supabase.instance.client;
    var getUsers = await supabase
        .from('ad_profile_data')
        .select()
        .eq('user_id', uid)
        .eq('role_id', role)
        .single();
    final user = UserProfile.fromMap(getUsers);
    state = user;
    return user;
  }
}

final authControllerProvider =
    StateNotifierProvider<AuthController, UserProfile>(
  (ref) => AuthController(),
);
