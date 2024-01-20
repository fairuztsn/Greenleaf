import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:greenleaf/config/app_colors.dart';
import 'package:greenleaf/features/common/application/user_faq_controller.dart';
import 'package:greenleaf/features/common/domain/entities/user_faq_entity.dart';
import 'package:greenleaf/features/common/presentation/widgets/app_error.dart';
import 'package:greenleaf/shared/base.dart';

///FAQ Search Screen
class TanyaSearchScreen extends ConsumerStatefulWidget {
  ///
  const TanyaSearchScreen({super.key});

  ///
  static const String route = 'tanyasearch';

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _TanyaSearchScreenState();
}

class _TanyaSearchScreenState extends ConsumerState<TanyaSearchScreen> {
  AsyncValue<List<UserFAQEntity>> get temp =>
      ref.watch(userFAQControllerProvider);
  final search = TextEditingController();
  List<UserFAQEntity> filteredList = [];

  @override
  Widget build(BuildContext context) {
    return BaseApp.inAppBackground(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: temp.when(
            data: (data) {
              void searchFAQ(String val) {
                if (data.isNotEmpty) {
                  setState(() {
                    filteredList = data
                        .where(
                          (element) => element.question
                              .toLowerCase()
                              .contains(search.text.toLowerCase()),
                        )
                        .toList();
                  });
                }
              }

              return ListView(
                children: [
                  TextField(
                    controller: search,
                    onChanged: searchFAQ,
                    onSubmitted: searchFAQ,
                    decoration: const InputDecoration(
                      hintText: 'Cari panduan yang Anda butuhkan disini!',
                      hintStyle: TextStyle(color: Colors.grey),
                      focusedBorder: InputBorder.none,
                      suffixIcon: Icon(
                        Icons.search,
                        color: AppColors.colorGreenLeaf,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Column(
                    children: filteredList.isEmpty
                        ? [
                            const Center(
                              child: Text(
                                'Tidak ada pencarian',
                                style: TextStyle(fontSize: 10),
                              ),
                            ),
                          ]
                        : filteredList
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
                                    fontSize: 8,
                                    letterSpacing: -0.5,
                                  ),
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
                ],
              );
            },
            error: (e, stktrc) => AppError(title: e.toString()),
            loading: () => const CircularProgressIndicator.adaptive(),
          ),
        ),
      ),
    );
  }
}
