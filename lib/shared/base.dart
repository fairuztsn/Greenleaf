import 'package:flutter/material.dart';
import 'package:greenleaf/res/assets.dart';
import 'package:greenleaf/shared/const.dart';

class BaseApp {
  static Widget standardBackground({
    final PreferredSizeWidget? appBar,
    required Widget body,
    final Widget? floatingActionButton,
    final FloatingActionButtonLocation? floatingActionButtonLocation,
  }) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: appBar,
        body: Container(
          child: body,
        ),
        floatingActionButton: floatingActionButton,
        floatingActionButtonLocation: floatingActionButtonLocation,
      ),
    );
  }

  static Widget generalAuthBackground({
    required BuildContext context,
    required String roleName,
    required String description,
    VoidCallback? login,
    VoidCallback? register,
  }) {
    return standardBackground(
        body: Center(
      child: ListView(
        children: [
          const SizedBox(
            height: 100,
          ),
          Image.asset(
            ImageAssets.loginRegisterLogo,
            height: 100,
            width: 90,
          ),
          const Text(
            "GreenLeaf",
            style: TextStyle(
                fontSize: 10,
                color: Constants.colorGreenLeaf,
                fontWeight: FontWeight.w800),
            textAlign: TextAlign.center,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 20,
                ),
                Text(
                  roleName,
                  style: const TextStyle(
                      fontWeight: FontWeight.w800,
                      fontSize: 35,
                      letterSpacing: -1),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  description,
                  style: const TextStyle(fontSize: 13, letterSpacing: -1),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 45,
                ),
                ElevatedButton(
                  onPressed: login,
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Constants.colorGreenLeaf,
                      shape: const RoundedRectangleBorder(
                          side: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      fixedSize: Size.fromWidth(
                          MediaQuery.of(context).size.width * 0.8)),
                  child: const Text(
                    "Masuk",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w800,
                        color: Colors.white,
                        letterSpacing: -1),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                const Text(
                  "Belum punya akun? Yuk Daftar",
                  style: TextStyle(
                      fontSize: 8,
                      fontWeight: FontWeight.w300,
                      letterSpacing: -1),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 5,
                ),
                OutlinedButton(
                  onPressed: register,
                  style: OutlinedButton.styleFrom(
                      backgroundColor: Colors.white,
                      shape: const RoundedRectangleBorder(
                          side: BorderSide(
                              color: Constants.colorGreenLeaf, width: 2),
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      fixedSize: Size.fromWidth(
                          MediaQuery.of(context).size.width * 0.8)),
                  child: const Text(
                    "Daftar",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w800,
                        color: Constants.colorGreenLeaf,
                        letterSpacing: -1),
                  ),
                ),
                const SizedBox(
                  height: 70,
                ),
                const Text(
                  "Dengan masuk atau mendaftar, kamu telah menyetujui",
                  style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w300,
                      letterSpacing: -1),
                  textAlign: TextAlign.center,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Flexible(
                      child: TextButton(
                          onPressed: () {},
                          child: const Text(
                            "kebijakan privasi",
                            style: TextStyle(
                                color: Constants.colorGreenLeaf,
                                fontSize: 15,
                                fontWeight: FontWeight.w300,
                                letterSpacing: -1),
                            textAlign: TextAlign.center,
                          )),
                    ),
                    const Text("dan",
                        style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w300,
                            letterSpacing: -1)),
                    Flexible(
                      child: TextButton(
                          onPressed: () {},
                          child: const Text(
                            "aturan layanan",
                            style: TextStyle(
                                color: Constants.colorGreenLeaf,
                                fontSize: 15,
                                fontWeight: FontWeight.w300,
                                letterSpacing: -1),
                            textAlign: TextAlign.center,
                          )),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    ));
  }

  static Widget loginRegisterBackground(
      {required String states,
      required List<Widget> children,
      required String linkable,
      required VoidCallback toLinkable,
      required VoidCallback lanjut,
      required String submit,
      required GlobalKey<FormState> formKey}) {
    return standardBackground(
        body: Center(
            child: ListView(shrinkWrap: true, children: [
      const SizedBox(
        height: 50,
      ),
      Image.asset(
        ImageAssets.loginRegisterLogo,
        height: 80,
        width: 80,
      ),
      const SizedBox(
        height: 10,
      ),
      Text(
        states,
        style: const TextStyle(
            fontWeight: FontWeight.w800, fontSize: 20, letterSpacing: -1),
        textAlign: TextAlign.center,
      ),
      const SizedBox(
        height: 15,
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 0),
        child: Form(
          key: formKey,
          child: Column(
            children: children,
          ),
        ),
      ),
      const SizedBox(
        height: 30,
      ),
      Image.asset(
        ImageAssets.brandingLogo,
        height: 25,
        width: 25,
      ),
      const SizedBox(
        height: 10,
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 0),
        child: TextButton(
            onPressed: toLinkable,
            child: Text(
              linkable,
              style: const TextStyle(
                  color: Constants.colorGreenLeaf,
                  fontSize: 10,
                  fontWeight: FontWeight.w300,
                  letterSpacing: -1),
            )),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 0),
        child: ElevatedButton(
          onPressed: lanjut,
          style: ElevatedButton.styleFrom(
              backgroundColor: Constants.colorGreenLeaf,
              shape: const RoundedRectangleBorder(
                  side: BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.all(Radius.circular(20)))),
          child: Text(
            submit,
            style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w800,
                color: Colors.white,
                letterSpacing: -1),
          ),
        ),
      ),
    ])));
  }

  static Widget inAppBackground({required Widget body}) {
    return standardBackground(
        appBar: AppBar(
          automaticallyImplyLeading: true,
          title: Image.asset(
            ImageAssets.loginRegisterLogo,
            height: 50,
            width: 50,
          ),
          centerTitle: true,
        ),
        body: body);
  }
}
