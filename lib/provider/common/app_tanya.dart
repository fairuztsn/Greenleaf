import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:greenleaf/models/ad_faq.dart';
import 'package:greenleaf/provider/common/user_profile.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final tanyaProvider = FutureProvider<List<FAQ>>((ref) async {
  final supabase = Supabase.instance.client;
  final currentUser = ref.watch(userProfileProvider).value;
  final userRole = currentUser!.role;
  var faqs = await supabase.from('ad_faq').select().eq('role_id', userRole!);
  if (faqs.isEmpty) {
    return [];
  } else {
    final faq = faqs.map((e) => FAQ.fromMap(e)).toList();
    return faq;
  }
});
