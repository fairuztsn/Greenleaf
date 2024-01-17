import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:greenleaf/controller/apptanya_controller.dart';
import 'package:greenleaf/models/ad_faq.dart';

final tanyaProvider = StateProvider<List<FAQ>>((ref) {
  ref.read(tanyaControllerProvider.notifier).fetchUsersFAQData();
  return ref.watch(tanyaControllerProvider);
});
