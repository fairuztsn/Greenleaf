import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:greenleaf/shared/base.dart';
import 'package:greenleaf/shared/const.dart';

class TanyaSearchScreen extends ConsumerStatefulWidget {
  const TanyaSearchScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _TanyaSearchScreenState();
}

class _TanyaSearchScreenState extends ConsumerState<TanyaSearchScreen> {
  @override
  Widget build(BuildContext context) {
    return BaseApp.inAppBackground(
        body: Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: ListView(children: [
          TextField(
            onChanged: (val) {},
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
          const Column(
            children: [
              ExpansionTile(
                title: Text(
                  "Apakah Membuat Search Field Itu Susah?",
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.w800),
                ),
                collapsedIconColor: Constants.colorGreenLeaf,
                iconColor: Constants.colorGreenLeaf,
                subtitle: Text(
                  "Ditanyakan oleh 1.000 pengguna",
                  style: TextStyle(fontSize: 8),
                ),
                children: [
                  ListTile(
                    title: Text(
                      "Lorem Ipsum Dolor Sit Amet",
                      style:
                          TextStyle(fontSize: 12, fontWeight: FontWeight.w800),
                    ),
                    subtitle: Text(
                        "Lorem Ipsum Dolor Sit Amet, Consectectur Adispiscing Elit",
                        style: TextStyle(fontSize: 8)),
                  )
                ],
              ),
            ],
          )
        ]),
      ),
    ));
  }
}
