import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:greenleaf/models/app_gc_order.dart';

final gcOrderProvider = StateProvider<List<GreenCarryOrder>>((ref) {
  return [];
});
