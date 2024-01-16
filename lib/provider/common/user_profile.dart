import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:greenleaf/models/ad_profile.dart';
import 'package:greenleaf/provider/common/session_user.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final userProfileProvider = FutureProvider<UserProfile>((ref) async {
  final supabase = Supabase.instance.client;
  final currentUser = ref.watch(userDataProvider);
  final userProfile = await supabase
      .from('ad_profile_data')
      .select()
      .eq('user_id', currentUser!.id)
      .eq('role_id', 1)
      .single();
  return UserProfile.fromMap(userProfile);
});
