// ignore_for_file: public_member_api_docs, inference_failure_on_instance_creation

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:greenleaf/config/app_colors.dart';
import 'package:greenleaf/features/common/application/user_faq_controller.dart';
import 'package:greenleaf/features/common/domain/entities/user_faq_entity.dart';
import 'package:greenleaf/features/common/presentation/screens/tanya/tanya_search.dart';
import 'package:greenleaf/features/common/presentation/widgets/app_error.dart';
import 'package:greenleaf/shared/base.dart';

class TanyaScreen extends ConsumerStatefulWidget {
  const TanyaScreen({super.key});

  static const String route = 'faq';

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _TanyaScreenState();
}

class _TanyaScreenState extends ConsumerState<TanyaScreen> {
  AsyncValue<List<UserFAQEntity>> get faq =>
      ref.watch(userFAQControllerProvider);

  @override
  Widget build(BuildContext context) {
    return BaseApp.inAppBackground(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: ListView(
            children: [
              OutlinedButton(
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: AppColors.colorGreenLeaf),
                ),
                onPressed: () {
                  // Navigator.push(
                  //   context,
                  //   PageTransition(
                  //     child: const TanyaSearchScreen(),
                  //     type: PageTransitionType.fade,
                  //   ),
                  // );
                  context.goNamed(TanyaSearchScreen.route);
                },
                child: const TextField(
                  enabled: false,
                  decoration: InputDecoration(
                    hintText: 'Cari panduan yang Anda butuhkan disini!',
                    hintStyle: TextStyle(color: Colors.grey),
                    focusedBorder: InputBorder.none,
                    suffixIcon: Icon(
                      Icons.search,
                      color: AppColors.colorGreenLeaf,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              faq.when(
                data: (data) => Column(
                  children: data
                      .map(
                        (e) => ExpansionTile(
                          title: Text(
                            e.question,
                            style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w800,
                              letterSpacing: -0.5,
                            ),
                          ),
                          collapsedIconColor: AppColors.colorGreenLeaf,
                          iconColor: AppColors.colorGreenLeaf,
                          subtitle: Text(
                            e.subquestion,
                            style: const TextStyle(
                                fontSize: 8, letterSpacing: -0.5),
                          ),
                          children: [
                            ListTile(
                              subtitle: Text(
                                e.answer,
                                style: const TextStyle(fontSize: 8),
                              ),
                            ),
                          ],
                        ),
                      )
                      .toList(),
                ),
                error: (e, stktrc) => AppError(title: e.toString()),
                loading: () => const CircularProgressIndicator.adaptive(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
