import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final userDataProvider =
    StateProvider<User?>((ref) => Supabase.instance.client.auth.currentUser);

final sessionDataProvider = StateProvider<Session?>(
    (ref) => Supabase.instance.client.auth.currentSession);
