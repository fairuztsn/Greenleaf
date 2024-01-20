// ignore_for_file: public_member_api_docs, inference_failure_on_instance_creation

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:greenleaf/features/app/GreenPeople/GreenCarry/presentation/screens/greencarry.dart';
import 'package:greenleaf/features/app/GreenPeople/GreenMarket/presentation/screens/greenmarket.dart';
import 'package:greenleaf/features/auth/auth_provider.dart';
import 'package:greenleaf/features/auth/presentation/screens/onboarding/onboarding.dart';
import 'package:greenleaf/features/common/presentation/screens/error_screen.dart';
import 'package:greenleaf/features/common/presentation/screens/home/home.dart';
import 'package:greenleaf/features/common/presentation/screens/home/home_search.dart';
import 'package:greenleaf/features/common/presentation/screens/navbar/navbar.dart';
import 'package:greenleaf/features/common/presentation/screens/profile/profile.dart';
import 'package:greenleaf/features/common/presentation/screens/tanya/tanya.dart';
import 'package:greenleaf/features/common/presentation/screens/tanya/tanya_search.dart';
import 'package:greenleaf/features/common/presentation/utils/extensions/ui_extension.dart';

/// Main router for the greenleaf app
///
/// ! Pay attention to the order of routes.
/// Create:  greenleaf/create
/// View:    greenleaf/:eid
/// Edit:    greenleaf/:eid/edit
/// where :edit means greenleaf entity id.
///
/// ! Note about parameters
/// Router keeps parameters in global map. It means that if you create route
/// organization/:id and organization/:id/department/:id. Department id will
///  override organization id. So use :oid and :did instead of :id
/// Also router does not provide option to set regex for parameters.
/// If you put - greenleaf/:eid before - greenleaf/create for route - greenleaf/create
/// will be called route - greenleaf/:eid
///
///
///

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

final router = GoRouter(
  navigatorKey: navigatorKey,
  routerNeglect: true,
  routes: [
    // GoRoute(
    //   path: '/',
    //   name: OrganizationsListScreen.routeName,
    //   builder: (context, state) => const OrganizationsListScreen(),
    //   routes: [
    //     GoRoute(
    //       path: OrganizationsCreateScreen.routePath,
    //       name: OrganizationsCreateScreen.routeName,
    //       builder: (context, state) => const OrganizationsCreateScreen(),
    //     ),
    //     GoRoute(
    //       path: '${DashboardScreen.routePath}/:oid',
    //       name: DashboardScreen.routeName,
    //       builder: (context, state) => DashboardScreen(
    //         title: F.title,
    //         organizationId: state.pathParameters['oid']!,
    //       ),
    //       routes: [
    //         GoRoute(
    //           path: DepartmentsCreateScreen.routePath,
    //           name: DepartmentsCreateScreen.routeName,
    //           builder: (context, state) => const DepartmentsCreateScreen(),
    //         ),
    //         GoRoute(
    //           path: DepartmentsViewScreen.routePath,
    //           name: DepartmentsViewScreen.routeName,
    //           builder: (context, state) => DepartmentsViewScreen(
    //             id: state.pathParameters['did']!,
    //           ),
    //         ),
    //         GoRoute(
    //           path: DepartmentsEditScreen.routePath,
    //           name: DepartmentsEditScreen.routeName,
    //           builder: (context, state) => DepartmentsEditScreen(
    //             id: state.pathParameters['did']!,
    //           ),
    //         ),
    //       ],
    //     ),
    GoRoute(
      path: '/${OnBoardingScreen.route}',
      name: OnBoardingScreen.route,
      builder: (context, state) => const OnBoardingScreen(),
    ),
    // GoRoute(
    //   path: '/${LoginScreen.route}/:rolelogid',
    //   name: LoginScreen.route,
    //   builder: (context, state) {
    //     return LoginScreen(rolename: state.pathParameters['rolelogid']!);
    //   },
    // ),
    // GoRoute(
    //   path: '/${RegisterScreen.route}/:roleregid',
    //   name: RegisterScreen.route,
    //   builder: (context, state) =>
    //       RegisterScreen(rolename: state.pathParameters['roleregid']!),
    //   routes: [
    //     GoRoute(
    //       path: SecondRegisterScreen.route,
    //       name: SecondRegisterScreen.route,
    //       builder: (context, state) {
    //         final extras = state.extra! as Extras;
    //         final data = extras.datas;
    //         return SecondRegisterScreen(
    //           email: data['email'].toString(),
    //           password: data['password'].toString(),
    //           phone: data['phone'].toString(),
    //         );
    //       },
    //     ),
    //   ],
    // ),
    GoRoute(
      path: '/${Navbar.route}',
      name: Navbar.route,
      builder: (context, state) => const Navbar(),
    ),
    GoRoute(
      path: '/${HomeSearchScreen.route}',
      name: HomeSearchScreen.route,
      builder: (context, state) => const HomeSearchScreen(),
    ),
    GoRoute(
      path: '/${HomePage.route}',
      name: HomePage.route,
      builder: (context, state) => const HomePage(),
      routes: [
        GoRoute(
          path: GreenCarryScreen.route,
          name: GreenCarryScreen.route,
          builder: (context, state) => const GreenCarryScreen(),
        ),
        GoRoute(
          path: GreenMarketScreen.route,
          name: GreenMarketScreen.route,
          builder: (context, state) => const GreenMarketScreen(),
        ),
      ],
    ),
    GoRoute(
      path: '/${ProfileScreen.route}',
      name: ProfileScreen.route,
      builder: (context, state) => const ProfileScreen(),
      routes: [
        //TODO: Implements Profile Menus and Place The Routes Here
      ],
    ),
    GoRoute(
      path: '/${TanyaScreen.route}',
      name: TanyaScreen.route,
      builder: (context, state) => const TanyaScreen(),
    ),
    GoRoute(
      path: '/${TanyaSearchScreen.route}',
      name: TanyaSearchScreen.route,
      builder: (context, state) => const TanyaSearchScreen(),
    ),
  ],
  observers: [
    routeObserver,
  ],
  redirect: (context, state) {
    final loggedIn = authStateListenable.value;
    final goingToLogin =
        state.matchedLocation.contains('/${OnBoardingScreen.route}');

    if (!loggedIn && !goingToLogin) {
      return '/${OnBoardingScreen.route}';
    }
    if (loggedIn && goingToLogin) return '/${Navbar.route}';

    return null;
  },
  refreshListenable: authStateListenable,
  debugLogDiagnostics: true,
  errorBuilder: (context, state) =>
      ErrorScreen(message: context.tr.somethingWentWrong),
);

/// Route observer to use with RouteAware
final RouteObserver<ModalRoute<void>> routeObserver =
    RouteObserver<ModalRoute<void>>();
