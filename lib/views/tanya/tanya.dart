import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:greenleaf/provider/common/app_tanya.dart';
import 'package:greenleaf/shared/base.dart';
import 'package:greenleaf/shared/const.dart';
import 'package:greenleaf/views/tanya/tanya_search.dart';
import 'package:page_transition/page_transition.dart';

class TanyaScreen extends ConsumerStatefulWidget {
  const TanyaScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _TanyaScreenState();
}

class _TanyaScreenState extends ConsumerState<TanyaScreen> {
  @override
  void initState() {
    super.initState();
    ref.read(tanyaProvider);
    // getDatas();
  }

  // Future getDatas() async {
  //   await ref.watch(tanyaProvider.future).then((value) {
  //     setState(() {
  //       faq = value;
  //     });
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    final faq = ref.watch(tanyaProvider);
    return BaseApp.inAppBackground(
        body: Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: ListView(children: [
          OutlinedButton(
              style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: Constants.colorGreenLeaf)),
              onPressed: () {
                ref.read(tanyaProvider);
                Navigator.push(
                    context,
                    PageTransition(
                        child: const TanyaSearchScreen(),
                        type: PageTransitionType.fade));
              },
              child: const TextField(
                enabled: false,
                decoration: InputDecoration(
                    hintText: "Cari panduan yang Anda butuhkan disini!",
                    hintStyle: TextStyle(color: Colors.grey),
                    focusedBorder: InputBorder.none,
                    suffixIcon: Icon(
                      Icons.search,
                      color: Constants.colorGreenLeaf,
                    )),
              )),
          const SizedBox(
            height: 20,
          ),
          Column(
            children: faq
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
                      style: const TextStyle(fontSize: 8, letterSpacing: -0.5),
                    ),
                    children: [
                      ListTile(
                        subtitle: Text(e.answer.toString(),
                            style: const TextStyle(fontSize: 8)),
                      )
                    ],
                  ),
                )
                .toList(),
          )
        ]),
      ),
    ));
  }
}
