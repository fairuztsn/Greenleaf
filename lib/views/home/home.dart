import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:greenleaf/provider/common/app_features.dart';
import 'package:greenleaf/provider/common/user_profile.dart';
import 'package:greenleaf/shared/base.dart';
import 'package:greenleaf/shared/const.dart';
import 'package:greenleaf/utils/alert.dart';
import 'package:greenleaf/views/home/home_search.dart';
import 'package:page_transition/page_transition.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  @override
  void initState() {
    super.initState();
    ref.read(userProfileProvider);
    ref.read(featuresProvider);
  }

  @override
  Widget build(BuildContext context) {
    final appFeatures = ref.watch(featuresProvider).value;
    final userProfile = ref.watch(userProfileProvider).value;
    return WillPopScope(
      onWillPop: () async {
        return await Alerts.showExitPopUp(context: context);
      },
      child: BaseApp.standardBackground(
          appBar: AppBar(
              elevation: 5.0,
              backgroundColor: Constants.colorGreenLeaf,
              title: const Center(
                child: Text(
                  "(open for advertisement or campaign)",
                  style: TextStyle(fontSize: 8, color: Colors.white),
                ),
              ),
              bottom: PreferredSize(
                preferredSize: const Size.fromHeight(kToolbarHeight),
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 20.0),
                  child: Container(
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(
                      Radius.circular(5.0),
                    )),
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width * 0.8,
                      child: OutlinedButton(
                          style: OutlinedButton.styleFrom(
                              backgroundColor: Colors.white,
                              side: const BorderSide(
                                  color: Constants.colorGreenLeaf)),
                          onPressed: () {
                            Navigator.push(
                                context,
                                PageTransition(
                                    child: const HomeSearchScreen(),
                                    type: PageTransitionType.fade));
                          },
                          child: const TextField(
                            enabled: false,
                            decoration: InputDecoration(
                                fillColor: Colors.white,
                                hintText: "Cari harga barang rongsok",
                                hintStyle: TextStyle(
                                    color: Colors.grey, letterSpacing: -0.5),
                                focusedBorder: InputBorder.none,
                                prefixIcon: Icon(
                                  Icons.search,
                                  color: Constants.colorGreenLeaf,
                                )),
                          )),
                    ),
                  ),
                ),
              )),
          body: Center(
            child: ListView(
              children: [
                const SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Text(
                    "Hai ${userProfile!.firstName.toString()}, mau ngapain hari ini?",
                    style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w800,
                        letterSpacing: -0.5),
                  ),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Wrap(
                    spacing: 50,
                    alignment: WrapAlignment.center,
                    children: appFeatures!.map((e) {
                      return Container(
                        width: MediaQuery.of(context).size.width * 0.3,
                        height: MediaQuery.of(context).size.height * 0.15,
                        clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: Colors.grey),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10)),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey,
                                offset: Offset(7, 5),
                              )
                            ]),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(
                                context, e.mobilePath.toString());
                          },
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.network(
                                e.iconLink.toString(),
                                height: 50,
                                width: 50,
                              ),
                              const SizedBox(
                                height: 3,
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.2,
                                child: Text(
                                  e.featureName.toString(),
                                  style: const TextStyle(
                                      fontSize: 8,
                                      fontWeight: FontWeight.w800,
                                      letterSpacing: -0.5),
                                  textAlign: TextAlign.center,
                                  overflow: TextOverflow.fade,
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
