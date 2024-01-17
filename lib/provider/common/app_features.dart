import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:greenleaf/controller/appfeatures_controller.dart';
import 'package:greenleaf/models/ad_feature.dart';

final featuresProvider = StateProvider.autoDispose<List<AppFeatures>>((ref) {
  ref.read(featuresControllerProvider.notifier).fetchUsersFeaturesData();
  return ref.watch(featuresControllerProvider);
});
