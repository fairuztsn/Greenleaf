// ignore_for_file: inference_failure_on_instance_creation, inference_failure_on_function_invocation, public_member_api_docs, unawaited_futures

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:greenleaf/config/app_colors.dart';
import 'package:greenleaf/features/auth/application/auth_controller.dart';
import 'package:greenleaf/features/auth/presentation/screens/onboarding/onboarding.dart';
import 'package:greenleaf/features/common/application/user_profile_controller.dart';
import 'package:greenleaf/features/common/domain/entities/user_profile_entity.dart';
import 'package:greenleaf/features/common/presentation/widgets/app_error.dart';
import 'package:greenleaf/res/assets.dart';
import 'package:greenleaf/shared/base.dart';
import 'package:greenleaf/utils/snackbar.dart';

class ProfileScreen extends ConsumerStatefulWidget {
  const ProfileScreen({super.key});

  static const String route = 'profile';

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends ConsumerState<ProfileScreen> {
  AsyncValue<UserProfileEntity> get userProfile =>
      ref.watch(userProfileControllerProvider);

  @override
  Widget build(BuildContext context) {
    return BaseApp.inAppBackground(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: ListView(
            children: [
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Profilku',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
              ),
              const SizedBox(
                height: 20,
              ),
              userProfile.when(
                  data: (data) => IntrinsicHeight(
                        child: Row(
                          children: [
                            ClipOval(
                              child: data.photoProfile == null ||
                                      data.photoProfile!.isEmpty ||
                                      data.photoProfile! == 'None'
                                  ? Image.asset(
                                      ImageAssets.loginRegisterLogo,
                                      height: 50,
                                      width: 50,
                                    )
                                  : Image.network(
                                      data.photoProfile.toString(),
                                      height: 50,
                                      width: 50,
                                    ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  children: [
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.19,
                                      child: Text(
                                        data.firstName + data.lastName,
                                        style: const TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w800,
                                        ),
                                        maxLines: 2,
                                        overflow: TextOverflow.fade,
                                      ),
                                    ),
                                    IconButton(
                                      iconSize: 20,
                                      onPressed: () {},
                                      icon: const Icon(
                                        Icons.edit,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.19,
                                  child: Text(
                                    data.email,
                                    style: const TextStyle(
                                      fontSize: 8,
                                    ),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.19,
                                  child: Text(
                                    data.phoneNumber,
                                    style: const TextStyle(
                                      fontSize: 8,
                                    ),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
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
                              child: Text(
                                data.homeStreet == null && data.homeCity == null
                                    ? ''
                                    : data.homeStreet.toString() +
                                        data.homeCity.toString(),
                              ),
                            ),
                          ],
                        ),
                      ),
                  error: (e, stktrc) => AppError(title: e.toString()),
                  loading: () => const CircularProgressIndicator.adaptive()),
              const SizedBox(
                height: 20,
              ),
              const Divider(),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'Akun',
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
                          'Riwayat Pesanan',
                          style: TextStyle(color: Colors.black),
                        ),
                      ],
                    ),
                  ),
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
                          'Metode Pembayaran',
                          style: TextStyle(color: Colors.black),
                        ),
                      ],
                    ),
                  ),
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
                          'Keamanan Akun',
                          style: TextStyle(color: Colors.black),
                        ),
                      ],
                    ),
                  ),
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
                          'Notifikasi',
                          style: TextStyle(color: Colors.black),
                        ),
                      ],
                    ),
                  ),
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
                          'Ketentuan & Privasi',
                          style: TextStyle(color: Colors.black),
                        ),
                      ],
                    ),
                  ),
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
                            backgroundColor: AppColors.colorGreenLeaf,
                          ),
                        ),
                      );
                      try {
                        await ref
                            .read(authControllerProvider.notifier)
                            .signOut()
                            .whenComplete(
                              () => context.goNamed(OnBoardingScreen.route),
                            );
                      } catch (e) {
                        if (mounted) {
                          navigator.pop();
                          Snackbars.showFailedSnackbar(
                            context,
                            title: 'Error occured',
                            message: e.toString(),
                          );
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
                          'Keluar',
                          style: TextStyle(color: Colors.black),
                        ),
                      ],
                    ),
                  ),
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
