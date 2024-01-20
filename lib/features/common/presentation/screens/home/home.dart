// ignore_for_file: public_member_api_docs, deprecated_member_use, inference_failure_on_instance_creation

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:greenleaf/config/app_colors.dart';
import 'package:greenleaf/features/common/application/user_feature_controller.dart';
import 'package:greenleaf/features/common/application/user_profile_controller.dart';
import 'package:greenleaf/features/common/domain/entities/user_feature_entity.dart';
import 'package:greenleaf/features/common/domain/entities/user_profile_entity.dart';
import 'package:greenleaf/features/common/presentation/screens/home/home_search.dart';
import 'package:greenleaf/features/common/presentation/utils/extensions/state_extension.dart';
import 'package:greenleaf/features/common/presentation/widgets/app_error.dart';
import 'package:greenleaf/shared/base.dart';
import 'package:greenleaf/utils/alert.dart';
import 'package:page_transition/page_transition.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  static const String route = 'home';
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  AsyncValue<UserProfileEntity> get userProfile =>
      ref.watch(userProfileControllerProvider);
  AsyncValue<List<UserFeaturesEntity>> get appFeatures =>
      ref.watch(userFeatureControllerProvider);
  bool isLoading = true;
  @override
  void initState() {
    super.initState();
    safeRebuild(init);
  }

  void init() {
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        await Alerts.showExitPopUp(context: context);
        return false;
      },
      child: BaseApp.standardBackground(
        appBar: AppBar(
          elevation: 5,
          backgroundColor: AppColors.colorGreenLeaf,
          title: const Center(
            child: Text(
              '(open for advertisement or campaign)',
              style: TextStyle(fontSize: 8, color: Colors.white),
            ),
          ),
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(kToolbarHeight),
            child: Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(5),
                  ),
                ),
                width: MediaQuery.of(context).size.width * 0.8,
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      backgroundColor: Colors.white,
                      side: const BorderSide(
                        color: AppColors.colorGreenLeaf,
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        PageTransition(
                          child: const HomeSearchScreen(),
                          type: PageTransitionType.fade,
                        ),
                      );
                    },
                    child: const TextField(
                      enabled: false,
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        hintText: 'Cari harga barang rongsok',
                        hintStyle: TextStyle(
                          color: Colors.grey,
                          letterSpacing: -0.5,
                        ),
                        focusedBorder: InputBorder.none,
                        prefixIcon: Icon(
                          Icons.search,
                          color: AppColors.colorGreenLeaf,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        body: Center(
          child: isLoading
              ? const CircularProgressIndicator.adaptive()
              : ListView(
                  children: [
                    const SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: userProfile.when(
                        data: (data) => Text(
                          'Hai ${data.firstName}, mau ngapain hari ini?',
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w800,
                            letterSpacing: -0.5,
                          ),
                        ),
                        error: (e, stktrc) => AppError(title: e.toString()),
                        loading: () =>
                            const CircularProgressIndicator.adaptive(),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: appFeatures.when(
                        data: (data) {
                          return Wrap(
                            spacing: 50,
                            alignment: WrapAlignment.center,
                            children: data.map((e) {
                              return Container(
                                width: MediaQuery.of(context).size.width * 0.3,
                                height:
                                    MediaQuery.of(context).size.height * 0.15,
                                clipBehavior: Clip.antiAlias,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(color: Colors.grey),
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(10),
                                  ),
                                  boxShadow: const [
                                    BoxShadow(
                                      color: Colors.grey,
                                      offset: Offset(7, 5),
                                    ),
                                  ],
                                ),
                                child: GestureDetector(
                                  onTap: () {
                                    // Navigator.pushNamed(
                                    //   context,
                                    //   e.mobilePath,
                                    // );
                                    context.go(e.mobilePath);
                                  },
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.network(
                                        e.iconFeature,
                                        height: 50,
                                        width: 50,
                                      ),
                                      const SizedBox(
                                        height: 3,
                                      ),
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.2,
                                        child: Text(
                                          e.name,
                                          style: const TextStyle(
                                            fontSize: 8,
                                            fontWeight: FontWeight.w800,
                                            letterSpacing: -0.5,
                                          ),
                                          textAlign: TextAlign.center,
                                          overflow: TextOverflow.fade,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            }).toList(),
                          );
                        },
                        error: (e, stktrc) => AppError(title: e.toString()),
                        loading: () =>
                            const CircularProgressIndicator.adaptive(),
                      ),
                    ),
                    userProfile.when(
                      data: (data) => data.roleId == 1
                          ? const Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: 20,
                                vertical: 10,
                              ),
                              child: Card(
                                child: ListTile(
                                  title: Text('Daftar Harga Barang Rongsok'),
                                ),
                              ),
                            )
                          : const SizedBox(),
                      error: (e, stktrc) => AppError(title: e.toString()),
                      loading: () => const CircularProgressIndicator.adaptive(),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
