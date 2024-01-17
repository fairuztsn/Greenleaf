import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:greenleaf/core/core.dart';
import 'package:greenleaf/models/ad_feature.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class FeaturesNotifier extends StateNotifier<List<AppFeatures>> {
  FeaturesNotifier() : super([]);

  FutureVoid fetchUsersFeaturesData() async {
    final supabase = Supabase.instance.client;

    var features = await supabase.from('ad_feature').select().eq('role_id', 1);
    if (features.isEmpty) {
      return;
    } else {
      final feat = features.map((e) => AppFeatures.fromMap(e)).toList();
      state = feat;
    }
  }
}

final featuresControllerProvider =
    StateNotifierProvider<FeaturesNotifier, List<AppFeatures>>((ref) {
  return FeaturesNotifier();
});
