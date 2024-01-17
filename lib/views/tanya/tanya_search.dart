import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:greenleaf/models/ad_faq.dart';
import 'package:greenleaf/provider/common/app_tanya.dart';
import 'package:greenleaf/shared/base.dart';
import 'package:greenleaf/shared/const.dart';

class TanyaSearchScreen extends ConsumerStatefulWidget {
  const TanyaSearchScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _TanyaSearchScreenState();
}

class _TanyaSearchScreenState extends ConsumerState<TanyaSearchScreen> {
  final search = TextEditingController();
  List<FAQ> filteredList = [];
  void searchFAQ(String val) {
    final temp = ref.watch(tanyaProvider);
    setState(() {
      filteredList = temp
          .where((element) => element.question!
              .toLowerCase()
              .contains(search.text.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return BaseApp.inAppBackground(
      body: Center(
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: ListView(
              children: [
                TextField(
                  controller: search,
                  onChanged: searchFAQ,
                  onSubmitted: searchFAQ,
                  decoration: const InputDecoration(
                      hintText: "Cari panduan yang Anda butuhkan disini!",
                      hintStyle: TextStyle(color: Colors.grey),
                      focusedBorder: InputBorder.none,
                      suffixIcon: Icon(
                        Icons.search,
                        color: Constants.colorGreenLeaf,
                      )),
                ),
                const SizedBox(
                  height: 20,
                ),
                Column(
                    children: filteredList == [] || filteredList.isEmpty
                        ? [
                            const Center(
                              child: Text(
                                "Tidak ada pencarian",
                                style: TextStyle(fontSize: 10),
                              ),
                            )
                          ]
                        : filteredList
                            .map(
                              (e) => ExpansionTile(
                                title: Text(
                                  e.question.toString(),
                                  style: const TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w800,
                                      letterSpacing: -0.5),
                                ),
                                collapsedIconColor: Constants.colorGreenLeaf,
                                iconColor: Constants.colorGreenLeaf,
                                subtitle: Text(
                                  e.subquestion.toString(),
                                  style: const TextStyle(
                                      fontSize: 8, letterSpacing: -0.5),
                                ),
                                children: [
                                  ListTile(
                                    subtitle: Text(e.answer.toString(),
                                        style: const TextStyle(fontSize: 8)),
                                  )
                                ],
                              ),
                            )
                            .toList())
              ],
            )),
      ),
    );
  }
}
