import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:greenleaf/res/assets.dart';
import 'package:greenleaf/shared/base.dart';

class ProfileScreen extends ConsumerStatefulWidget {
  const ProfileScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends ConsumerState<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return BaseApp.inAppBackground(
        body: Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: ListView(children: [
          const SizedBox(
            height: 20,
          ),
          const Text(
            "Profilku",
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
          ),
          const SizedBox(
            height: 20,
          ),
          IntrinsicHeight(
            child: Row(
              children: [
                ClipOval(
                  child: Image.asset(
                    ImageAssets.loginRegisterLogo,
                    height: 50,
                    width: 50,
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.19,
                          child: const Text(
                            "Annisa Simanjuntak",
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w800),
                            maxLines: 2,
                            overflow: TextOverflow.fade,
                          ),
                        ),
                        IconButton(
                            iconSize: 20,
                            onPressed: () {},
                            icon: const Icon(
                              Icons.edit,
                            ))
                      ],
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.19,
                      child: const Text(
                        "annnisa@gmail.com",
                        style: TextStyle(
                          fontSize: 8,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.19,
                      child: const Text(
                        "+62893842099103",
                        style: TextStyle(
                          fontSize: 8,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  width: 5,
                ),
                const VerticalDivider(
                  color: Colors.grey,
                  thickness: 1,
                ),
                const SizedBox(
                  width: 20,
                ),
                const Flexible(child: Text("Jl. Telyu no 1 Sukapura"))
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const Divider(),
          const SizedBox(
            height: 10,
          ),
          const Text(
            "Akun",
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
          ),
          Row(
            children: [
              TextButton(
                  style: TextButton.styleFrom(
                    iconColor: Colors.black,
                  ),
                  onPressed: () {},
                  child: const Row(
                    children: [
                      Icon(Icons.history),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        "Riwayat Pesanan",
                        style: TextStyle(color: Colors.black),
                      )
                    ],
                  ))
            ],
          ),
          Row(
            children: [
              TextButton(
                  style: TextButton.styleFrom(
                    iconColor: Colors.black,
                  ),
                  onPressed: () {},
                  child: const Row(
                    children: [
                      Icon(Icons.credit_card),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        "Metode Pembayaran",
                        style: TextStyle(color: Colors.black),
                      )
                    ],
                  ))
            ],
          ),
          Row(
            children: [
              TextButton(
                  style: TextButton.styleFrom(
                    iconColor: Colors.black,
                  ),
                  onPressed: () {},
                  child: const Row(
                    children: [
                      Icon(Icons.notifications),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        "Notifikasi",
                        style: TextStyle(color: Colors.black),
                      )
                    ],
                  ))
            ],
          ),
          Row(
            children: [
              TextButton(
                  style: TextButton.styleFrom(
                    iconColor: Colors.black,
                  ),
                  onPressed: () {},
                  child: const Row(
                    children: [
                      Icon(Icons.terminal),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        "Ketentuan & Privasi",
                        style: TextStyle(color: Colors.black),
                      ),
                    ],
                  ))
            ],
          ),
          Row(
            children: [
              TextButton(
                  style: TextButton.styleFrom(
                    iconColor: Colors.black,
                  ),
                  onPressed: () {},
                  child: const Row(
                    children: [
                      Icon(Icons.logout),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        "Keluar",
                        style: TextStyle(color: Colors.black),
                      )
                    ],
                  ))
            ],
          ),
          const SizedBox(
            height: 50,
          ),
          Center(
            child: Image.asset(
              ImageAssets.brandingLogo,
              height: 70,
              width: 70,
            ),
          )
        ]),
      ),
    ));
  }
}
