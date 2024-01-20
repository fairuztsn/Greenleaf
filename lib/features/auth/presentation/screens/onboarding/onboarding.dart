// ignore_for_file: public_member_api_docs, inference_failure_on_instance_creation

import 'package:flutter/material.dart';
import 'package:greenleaf/config/app_colors.dart';
import 'package:greenleaf/features/auth/presentation/screens/login/login.dart';
import 'package:greenleaf/features/auth/presentation/screens/onboarding/roled/loginregister.dart';
import 'package:greenleaf/features/auth/presentation/screens/register/register.dart';
import 'package:greenleaf/res/assets.dart';
import 'package:greenleaf/res/strings.dart';
import 'package:greenleaf/shared/base.dart';
import 'package:page_transition/page_transition.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  static const String route = 'onboarding';

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  @override
  Widget build(BuildContext context) {
    return BaseApp.standardBackground(
      appBar: AppBar(
        toolbarHeight: MediaQuery.of(context).size.height * 0.135,
        automaticallyImplyLeading: false,
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Image.asset(
            ImageAssets.onboardingLogo,
            height: 80,
            width: 120,
          ),
        ),
      ),
      body: Center(
        child: ListView(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Selamat Datang di GreenLeaf',
                  style: TextStyle(
                    fontWeight: FontWeight.w800,
                    fontSize: 25,
                    letterSpacing: -1.5,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 15,
                ),
                const Text(
                  'Aplikasi dengan inovasi pertama di\nIndonesia #1 yang langsung\nmenjemput sampah anorganikmu di\ndepan pintu dan mendapat penghasilan',
                  style: TextStyle(
                    fontWeight: FontWeight.w300,
                    fontSize: 13,
                    letterSpacing: -1,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 15,
                ),
                const Text(
                  'Yuk pilih dulu nih, kamu yang mana?',
                  style: TextStyle(
                    fontWeight: FontWeight.w800,
                    fontSize: 13,
                    letterSpacing: -0.5,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 15,
                ),
                const Text(
                  'Untuk kamu yang ingin sampahnya dijemput',
                  style: TextStyle(
                    fontWeight: FontWeight.w200,
                    fontSize: 8,
                    letterSpacing: -0.5,
                  ),
                  textAlign: TextAlign.center,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      PageTransition(
                        child: LoginRegister(
                          rolename: RoleStrings.greenPeople,
                          description:
                              'Kami akan menjemput sampah anorganikmu tepat di depan pintu dan memberikanmu penghasilan tambahan',
                          login: () {
                            Navigator.push(
                              context,
                              PageTransition(
                                child: const LoginScreen(
                                  rolename: RoleStrings.greenPeople,
                                ),
                                type: PageTransitionType.leftToRight,
                              ),
                            );
                          },
                          register: () {
                            Navigator.push(
                              context,
                              PageTransition(
                                child: const RegisterScreen(
                                  rolename: RoleStrings.greenPeople,
                                ),
                                type: PageTransitionType.leftToRight,
                              ),
                            );
                          },
                        ),
                        type: PageTransitionType.topToBottom,
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.colorGreenLeaf,
                    shape: const RoundedRectangleBorder(
                      side: BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    fixedSize: Size.fromWidth(
                      MediaQuery.of(context).size.width * 0.8,
                    ),
                  ),
                  child: const Text(
                    RoleStrings.greenPeople,
                    style: TextStyle(
                      fontWeight: FontWeight.w800,
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  'Atau',
                  style: TextStyle(
                    fontWeight: FontWeight.w300,
                    fontSize: 13,
                    letterSpacing: -1,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  'Untuk kamu yang ingin menjalin kerjasama',
                  style: TextStyle(
                    fontWeight: FontWeight.w200,
                    fontSize: 8,
                    letterSpacing: -0.5,
                  ),
                  textAlign: TextAlign.center,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      PageTransition(
                        child: LoginRegister(
                          rolename: RoleStrings.greenPartner,
                          description:
                              'Yuk menjadi bagian dari kami, daftarkan usaha pengelolaan sampah anda',
                          login: () {
                            Navigator.push(
                              context,
                              PageTransition(
                                child: const LoginScreen(
                                  rolename: RoleStrings.greenPartner,
                                ),
                                type: PageTransitionType.leftToRight,
                              ),
                            );
                          },
                          register: () {
                            Navigator.push(
                              context,
                              PageTransition(
                                child: const RegisterScreen(
                                  rolename: RoleStrings.greenPartner,
                                ),
                                type: PageTransitionType.leftToRight,
                              ),
                            );
                          },
                        ),
                        type: PageTransitionType.topToBottom,
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.colorGreenLeaf,
                    shape: const RoundedRectangleBorder(
                      side: BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    fixedSize: Size.fromWidth(
                      MediaQuery.of(context).size.width * 0.8,
                    ),
                  ),
                  child: const Text(
                    RoleStrings.greenPartner,
                    style: TextStyle(
                      fontWeight: FontWeight.w800,
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  'Atau',
                  style: TextStyle(
                    fontWeight: FontWeight.w300,
                    fontSize: 13,
                    letterSpacing: -1,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  'Untuk kamu yang ingin menjadi mitra kami',
                  style: TextStyle(
                    fontWeight: FontWeight.w200,
                    fontSize: 8,
                    letterSpacing: -0.5,
                  ),
                  textAlign: TextAlign.center,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      PageTransition(
                        child: LoginRegister(
                          rolename: RoleStrings.greenWorker,
                          description:
                              'Jadilah mitra kami dalam menjemput sampah anorganik pelanggan dan mengantarkan kepada partner kami.',
                          login: () {
                            Navigator.push(
                              context,
                              PageTransition(
                                child: const LoginScreen(
                                  rolename: RoleStrings.greenWorker,
                                ),
                                type: PageTransitionType.leftToRight,
                              ),
                            );
                          },
                          register: () {
                            Navigator.push(
                              context,
                              PageTransition(
                                child: const RegisterScreen(
                                  rolename: RoleStrings.greenWorker,
                                ),
                                type: PageTransitionType.leftToRight,
                              ),
                            );
                          },
                        ),
                        type: PageTransitionType.topToBottom,
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.colorGreenLeaf,
                    shape: const RoundedRectangleBorder(
                      side: BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    fixedSize: Size.fromWidth(
                      MediaQuery.of(context).size.width * 0.8,
                    ),
                  ),
                  child: const Text(
                    RoleStrings.greenWorker,
                    style: TextStyle(
                      fontWeight: FontWeight.w800,
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                const Text(
                  'Dengan masuk atau mendaftar, kamu telah menyetujui',
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w300,
                    letterSpacing: -0.5,
                  ),
                  textAlign: TextAlign.center,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flexible(
                      child: TextButton(
                        onPressed: () {},
                        child: const Text(
                          'kebijakan privasi',
                          style: TextStyle(
                            color: AppColors.colorGreenLeaf,
                            fontSize: 15,
                            fontWeight: FontWeight.w300,
                            letterSpacing: -1,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    const Text(
                      'dan',
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w300,
                        letterSpacing: -0.5,
                      ),
                    ),
                    Flexible(
                      child: TextButton(
                        onPressed: () {},
                        child: const Text(
                          'aturan layanan',
                          style: TextStyle(
                            color: AppColors.colorGreenLeaf,
                            fontSize: 15,
                            fontWeight: FontWeight.w300,
                            letterSpacing: -1,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
