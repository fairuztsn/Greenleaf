import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:greenleaf/controller/auth_controller.dart';
import 'package:greenleaf/provider/common/app_features.dart';
import 'package:greenleaf/provider/common/user_profile.dart';
import 'package:greenleaf/res/assets.dart';
import 'package:greenleaf/shared/base.dart';
import 'package:greenleaf/shared/const.dart';
import 'package:greenleaf/utils/snackbar.dart';
import 'package:greenleaf/views/onboarding/onboarding.dart';
import 'package:page_transition/page_transition.dart';

class ProfileScreen extends ConsumerStatefulWidget {
  const ProfileScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends ConsumerState<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    final userProfile = ref.watch(userProfileProvider).value;
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
                  child: userProfile!.photoProfile != null
                      ? Image.network(
                          userProfile.photoProfile.toString(),
                          height: 50,
                          width: 50,
                        )
                      : Image.asset(
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
                          child: Text(
                            userProfile.firstName.toString() +
                                userProfile.lastName.toString(),
                            style: const TextStyle(
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
                      child: Text(
                        userProfile.email.toString(),
                        style: const TextStyle(
                          fontSize: 8,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.19,
                      child: Text(
                        userProfile.phoneNumber == null
                            ? ""
                            : userProfile.phoneNumber.toString(),
                        style: const TextStyle(
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
                Flexible(
                    child: Text(userProfile.homeStreet == null &&
                            userProfile.homeCity == null
                        ? ""
                        : userProfile.homeStreet.toString() +
                            userProfile.homeCity.toString()))
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
                      Icon(Icons.security),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        "Keamanan Akun",
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
                  onPressed: () async {
                    final navigator = Navigator.of(context);
                    showDialog(
                        context: context,
                        barrierDismissible: false,
                        builder: (context) => const Center(
                              child: CircularProgressIndicator.adaptive(
                                backgroundColor: Constants.colorGreenLeaf,
                              ),
                            ));
                    try {
                      await ref
                          .read(authControllerProvider.notifier)
                          .signOutAllUsers();
                      ref.invalidate(userProfileProvider);
                      ref.invalidate(featuresProvider);

                      if (mounted) {
                        navigator.popUntil((route) => route.isFirst);
                        navigator.pushReplacement(PageTransition(
                            child: const OnBoardingScreen(),
                            type: PageTransitionType.fade));
                      }
                    } catch (e) {
                      if (mounted) {
                        navigator.pop();
                        Snackbars.showFailedSnackbar(context,
                            title: "Error occured", message: e.toString());
                      }
                    }
                  },
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
