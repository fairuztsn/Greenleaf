import 'package:flutter/material.dart';
import 'package:greenleaf/res/assets.dart';
import 'package:greenleaf/shared/base.dart';
import 'package:greenleaf/shared/const.dart';
import 'package:greenleaf/views/login/login.dart';
import 'package:greenleaf/views/onboarding/roled/loginregister.dart';
import 'package:greenleaf/views/register/register.dart';
import 'package:page_transition/page_transition.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

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
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Image.asset(
                ImageAssets.onboardingLogo,
                height: 80,
                width: 120,
              ),
            )),
        body: Center(
          child: ListView(children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Selamat Datang di GreenLeaf",
                  style: TextStyle(fontWeight: FontWeight.w800, fontSize: 25),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 15,
                ),
                const Text(
                  "Aplikasi dengan inovasi pertama di\nIndonesia #1 yang langsung\nmenjemput sampah anorganikmu di\ndepan pintu dan mendapat penghasilan",
                  style: TextStyle(fontWeight: FontWeight.w300, fontSize: 13),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 15,
                ),
                const Text(
                  "Yuk pilih dulu nih, kamu yang mana?",
                  style: TextStyle(fontWeight: FontWeight.w800, fontSize: 13),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 15,
                ),
                const Text(
                  "Untuk kamu yang ingin sampahnya dijemput",
                  style: TextStyle(fontWeight: FontWeight.w200, fontSize: 8),
                  textAlign: TextAlign.center,
                ),
                ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          PageTransition(
                              child: LoginRegister(
                                  rolename: "GreenPeople",
                                  description:
                                      "Kami akan menjemput sampah anorganikmu tepat di depan pintu dan memberikanmu penghasilan tambahan",
                                  login: () {
                                    Navigator.push(
                                        context,
                                        PageTransition(
                                            child: const LoginScreen(
                                              rolename: "GreenPeople",
                                            ),
                                            type: PageTransitionType
                                                .leftToRight));
                                  },
                                  register: () {
                                    Navigator.push(
                                        context,
                                        PageTransition(
                                            child: const RegisterScreen(),
                                            type: PageTransitionType
                                                .leftToRight));
                                  }),
                              type: PageTransitionType.topToBottom));
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Constants.colorGreenLeaf,
                        shape: const RoundedRectangleBorder(
                            side: BorderSide(color: Colors.white),
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        fixedSize: Size.fromWidth(
                            MediaQuery.of(context).size.width * 0.8)),
                    child: const Text("GreenPeople",
                        style: TextStyle(
                            fontWeight: FontWeight.w800,
                            fontSize: 20,
                            color: Colors.white))),
                const SizedBox(
                  height: 10,
                ),
                const Text("Atau",
                    style:
                        TextStyle(fontWeight: FontWeight.w300, fontSize: 13)),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "Untuk kamu yang ingin menjalin kerjasama",
                  style: TextStyle(fontWeight: FontWeight.w200, fontSize: 8),
                  textAlign: TextAlign.center,
                ),
                ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          PageTransition(
                              child: LoginRegister(
                                  rolename: "GreenPartner",
                                  description:
                                      "Yuk menjadi bagian dari kami, daftarkan usaha pengelolaan sampah anda",
                                  login: () {
                                    Navigator.push(
                                        context,
                                        PageTransition(
                                            child: const LoginScreen(
                                              rolename: "GreenPartner",
                                            ),
                                            type: PageTransitionType
                                                .leftToRight));
                                  },
                                  register: () {
                                    Navigator.push(
                                        context,
                                        PageTransition(
                                            child: const RegisterScreen(),
                                            type: PageTransitionType
                                                .leftToRight));
                                  }),
                              type: PageTransitionType.topToBottom));
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Constants.colorGreenLeaf,
                        shape: const RoundedRectangleBorder(
                            side: BorderSide(color: Colors.white),
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        fixedSize: Size.fromWidth(
                            MediaQuery.of(context).size.width * 0.8)),
                    child: const Text("GreenPartner",
                        style: TextStyle(
                            fontWeight: FontWeight.w800,
                            fontSize: 20,
                            color: Colors.white))),
                const SizedBox(
                  height: 10,
                ),
                const Text("Atau",
                    style:
                        TextStyle(fontWeight: FontWeight.w300, fontSize: 13)),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "Untuk kamu yang ingin menjadi mitra kami",
                  style: TextStyle(fontWeight: FontWeight.w200, fontSize: 8),
                  textAlign: TextAlign.center,
                ),
                ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          PageTransition(
                              child: LoginRegister(
                                  rolename: "GreenWorker",
                                  description:
                                      "Jadilah mitra kami dalam menjemput sampah anorganik pelanggan dan mengantarkan kepada partner kami.",
                                  login: () {
                                    Navigator.push(
                                        context,
                                        PageTransition(
                                            child: const LoginScreen(
                                              rolename: "GreenWorker",
                                            ),
                                            type: PageTransitionType
                                                .leftToRight));
                                  },
                                  register: () {
                                    Navigator.push(
                                        context,
                                        PageTransition(
                                            child: const RegisterScreen(),
                                            type: PageTransitionType
                                                .leftToRight));
                                  }),
                              type: PageTransitionType.topToBottom));
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Constants.colorGreenLeaf,
                        shape: const RoundedRectangleBorder(
                            side: BorderSide(color: Colors.white),
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        fixedSize: Size.fromWidth(
                            MediaQuery.of(context).size.width * 0.8)),
                    child: const Text("GreenWorker",
                        style: TextStyle(
                            fontWeight: FontWeight.w800,
                            fontSize: 20,
                            color: Colors.white))),
                const SizedBox(
                  height: 30,
                ),
                const Text(
                  "Dengan masuk atau mendaftar, kamu telah menyetujui",
                  style: TextStyle(fontSize: 10, fontWeight: FontWeight.w300),
                  textAlign: TextAlign.center,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flexible(
                      child: TextButton(
                          onPressed: () {},
                          child: const Text(
                            "kebijakan privasi",
                            style: TextStyle(
                                color: Constants.colorGreenLeaf,
                                fontSize: 15,
                                fontWeight: FontWeight.w300),
                            textAlign: TextAlign.center,
                          )),
                    ),
                    const Text("dan",
                        style: TextStyle(
                            fontSize: 10, fontWeight: FontWeight.w300)),
                    Flexible(
                      child: TextButton(
                          onPressed: () {},
                          child: const Text(
                            "aturan layanan",
                            style: TextStyle(
                                color: Constants.colorGreenLeaf,
                                fontSize: 15,
                                fontWeight: FontWeight.w300),
                            textAlign: TextAlign.center,
                          )),
                    ),
                  ],
                )
              ],
            ),
          ]),
        ));
  }
}
