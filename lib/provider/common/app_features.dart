import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:greenleaf/models/ad_feature.dart';
import 'package:greenleaf/provider/common/user_profile.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final featuresProvider = FutureProvider<List<AppFeatures>>((ref) async {
  final supabase = Supabase.instance.client;
  final currentUser = ref.watch(userProfileProvider).value;
  final userRole = currentUser!.role;

  var features =
      await supabase.from('ad_feature').select().eq('role_id', userRole!);
  if (features.isEmpty) {
    return [];
  } else {
    final feat = features.map((e) => AppFeatures.fromMap(e)).toList();
    return feat;
  }
});
