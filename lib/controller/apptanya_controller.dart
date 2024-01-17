import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:greenleaf/core/core.dart';
import 'package:greenleaf/models/ad_faq.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class TanyaNotifier extends StateNotifier<List<FAQ>> {
  TanyaNotifier() : super([]);

  FutureVoid fetchUsersFAQData() async {
    final supabase = Supabase.instance.client;
    var faqs = await supabase.from('ad_faq').select().eq('role_id', 1);
    if (faqs.isEmpty) {
      return;
    } else {
      final faq = faqs.map((e) => FAQ.fromMap(e)).toList();
      state = faq;
    }
  }
}

final tanyaControllerProvider =
    StateNotifierProvider<TanyaNotifier, List<FAQ>>((ref) {
  return TanyaNotifier();
});
