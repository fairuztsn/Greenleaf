import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:greenleaf/config/app_colors.dart';
import 'package:greenleaf/features/app/GreenPeople/GreenCarry/domain/entities/gc_order_entity.dart';
import 'package:greenleaf/res/assets.dart';
import 'package:greenleaf/shared/base.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/zondicons.dart';

///
class GreenCarryScreen extends ConsumerStatefulWidget {
  ///
  const GreenCarryScreen({super.key});

  ///
  static const String route = 'greencarry';

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _GreenCarryScreenState();
}

class _GreenCarryScreenState extends ConsumerState<GreenCarryScreen> {
  List<GCOrderEntity> userOrders = [];
  @override
  Widget build(BuildContext context) {
    return BaseApp.standardBackground(
      appBar: AppBar(
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
              Column(
                children: [
                  const SizedBox(height: 20),
                  const Text('Yuk Diisi'),
                  Card(
                    child: GestureDetector(
                      onTap: () {},
                      child: const ListTile(
                        shape: RoundedRectangleBorder(
                          side: BorderSide(color: AppColors.colorGreenLeaf),
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        leading: Iconify(
                          Zondicons.document,
                          color: AppColors.colorGreenLeaf,
                        ),
                        title: Text(
                          'Jenis Barang',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        trailing: Row(
                          children: [
                            Text('Isi Jenis Barang'),
                            Iconify(
                              Zondicons.arrow_thick_right,
                              color: Colors.grey,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Card(
                    child: GestureDetector(
                      onTap: () {},
                      child: const ListTile(
                        shape: RoundedRectangleBorder(
                          side: BorderSide(color: AppColors.colorGreenLeaf),
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        leading: Icon(
                          Icons.scale,
                          color: AppColors.colorGreenLeaf,
                        ),
                        title: Text(
                          'Total Berat',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        trailing: Row(
                          children: [
                            Text('Pilih'),
                            Iconify(
                              Zondicons.arrow_thick_right,
                              color: Colors.grey,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
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
                          'Foto Barang',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        trailing: Row(
                          children: [
                            Text('Tambah'),
                            Iconify(
                              Zondicons.arrow_thick_right,
                              color: Colors.grey,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
              if (userOrders.isEmpty)
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.colorGreenLeaf,
                  ),
                  onPressed: () {},
                  child: const Text(
                    'Lanjut',
                    style: TextStyle(color: Colors.white),
                  ),
                )
              else
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.colorGreenLeaf,
                  ),
                  onPressed: () {},
                  child: const Text(
                    'Tambah',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
