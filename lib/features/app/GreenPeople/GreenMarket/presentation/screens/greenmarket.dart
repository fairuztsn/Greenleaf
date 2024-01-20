// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:greenleaf/config/app_colors.dart';
import 'package:greenleaf/res/assets.dart';
import 'package:greenleaf/shared/base.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/zondicons.dart';

class GreenMarketScreen extends ConsumerStatefulWidget {
  const GreenMarketScreen({super.key});

  static const String route = 'greenmarket';

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _GreenMarketScreenState();
}

class _GreenMarketScreenState extends ConsumerState<GreenMarketScreen> {
  @override
  Widget build(BuildContext context) {
    return BaseApp.standardBackground(
      appBar: AppBar(
        leading: const Text(
          'Pemesanan',
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w800,
          ),
        ),
        title: Image.asset(
          ImageAssets.loginRegisterLogo,
          height: 50,
          width: 50,
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: ListView(
            children: [
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Review Pesanan',
                style: TextStyle(fontSize: 10, fontWeight: FontWeight.w800),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Barang Rongsoknya mau dijemput dimana nih?',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800),
              ),
              Card(
                child: GestureDetector(
                  onTap: () {},
                  child: const ListTile(
                    shape: RoundedRectangleBorder(
                      side: BorderSide(color: AppColors.colorGreenLeaf),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    leading: Iconify(
                      Zondicons.arrow_up,
                      color: AppColors.colorGreenLeaf,
                    ),
                    title: Text(
                      'User Name',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    subtitle: Text(
                      'Jl. Telekomunikasi 1 Sukapura',
                      style: TextStyle(fontSize: 10),
                    ),
                    trailing: Iconify(
                      Zondicons.arrow_thick_right,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
