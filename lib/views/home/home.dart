import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:greenleaf/res/assets.dart';
import 'package:greenleaf/shared/base.dart';
import 'package:greenleaf/shared/const.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  @override
  Widget build(BuildContext context) {
    Future showExitPopUp(isRoute) async {
      return await showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
                title: const Text(
                  'Exit App?',
                  style: TextStyle(
                      fontFamily: 'Mulish', fontWeight: FontWeight.w700),
                ),
                actions: [
                  ElevatedButton(
                    onPressed: () async {
                      Navigator.of(context).pop(true);
                    },
                    style: OutlinedButton.styleFrom(
                        side: const BorderSide(
                            color: Constants.colorGreenLeaf, width: 1),
                        shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10)))),
                    child: const Text(
                      'Yes',
                      style: TextStyle(
                          fontFamily: 'Mulish',
                          fontWeight: FontWeight.w600,
                          fontSize: 16),
                    ),
                  ),
                  OutlinedButton(
                    onPressed: () {
                      Navigator.of(context).pop(false);
                    },
                    style: OutlinedButton.styleFrom(
                        side: const BorderSide(
                            color: Constants.colorGreenLeaf, width: 1),
                        shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10)))),
                    child: const Text(
                      'No',
                      style: TextStyle(
                          color: Constants.colorGreenLeaf,
                          fontFamily: 'Mulish',
                          fontWeight: FontWeight.w600,
                          fontSize: 16),
                    ),
                  )
                ],
              ));
    }

    return BaseApp.inAppBackground(
        body: Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: ListView(
          children: [
            const SizedBox(
              height: 50,
            ),
            const Divider(),
            const Text(
              "Hai Annisa, mau ngapain nih?",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w800),
            ),
            const SizedBox(height: 20),
            Card(
              color: Constants.colorGreenLeaf,
              child: Wrap(
                spacing: 50,
                alignment: WrapAlignment.center,
                children: [
                  //TODO: Implement Feature Mapping Based on Role
                  Container(
                    width: MediaQuery.of(context).size.width * 0.3,
                    height: MediaQuery.of(context).size.height * 0.201,
                    clipBehavior: Clip.antiAlias,
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                              color: Constants.colorGreenLeaf,
                              offset: Offset(5.5, 5.5),
                              blurRadius: 5),
                          BoxShadow(
                              color: Colors.grey,
                              offset: Offset(5.5, 5.5),
                              blurRadius: 5)
                        ],
                        shape: BoxShape.circle),
                    child: GestureDetector(
                      onTap: () {},
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            ImageAssets.splashLogo,
                            height: 50,
                            width: 50,
                          ),
                          const SizedBox(
                            height: 3,
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.2,
                            child: const Text(
                              "Anorganic Pick-Up",
                              style: TextStyle(
                                  fontSize: 8, fontWeight: FontWeight.w800),
                              textAlign: TextAlign.center,
                              overflow: TextOverflow.fade,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Divider(),
          ],
        ),
      ),
    ));
  }
}
