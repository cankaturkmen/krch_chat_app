import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../pages/Home/myhomepage.dart';
import '../pages/Login/login.dart';
import 'notifiers/loginInfo.dart';
import 'shared.dart';

const _pageKey = ValueKey('_pageKey');
const _scaffoldKey = ValueKey('_scaffoldKey');

List<NavigationDestination> destinations = [
  const NavigationDestination(
    label: 'HomePage',
    icon: Icon(Icons.home), // Modify this line
    route: '/home',
  ),
  const NavigationDestination(
    label: 'About Us',
    icon: Icon(Icons.article), // Modify this line
    route: '/aboutUs',
  ),
];

class NavigationDestination {
  const NavigationDestination({
    required this.route,
    required this.label,
    required this.icon,
    this.child,
  });

  final String route;
  final String label;
  final Icon icon;
  final Widget? child;
}

class AppRouter {
  late final LoginInfo loginInfo;
  GoRouter get router => appRouter;
  AppRouter(this.loginInfo);
  late final GoRouter appRouter = GoRouter(
    refreshListenable: loginInfo,
    redirect: (context, state) async {
      // final isLogedIn = loginInfo.loggedIn;
      // final isInitialized = loginInfo.initialized;
      // final isOnboarded = loginInfo.onboarding;
      // final isGoingToLogin = state.subloc == '/login';
      // final isGoingToInit = state.subloc == '/splash';
      // final isGoingToOnboard = state.subloc == '/onBoard';
      // if (state.location == "/") {
      //   return '/home';
      // }
      // if (state.location == "/forgetPassword") {
      //   return null;
      // }
      // if (!loginInfo.initialized && state.location != "/login") {
      //   bool result = false;
      //   if (state.location == "/patientLogin") {
      //     return '/patientLogin';
      //   } else if (state.location == "/patientProfile") {
      //     bool result = await loginInfo.patientAutoLogin();
      //     if (result) {
      //       return '/patientProfile';
      //     }
      //     return '/patientLogin';
      //   } else if (!loginInfo.loggingOut) {
      //     result = await loginInfo.autoLogin(context);
      //   }

      //   if (!result) {
      //     return '/login';
      //   } else {
      //     return '/home';
      //   }
      // } else if (loginInfo.initialized && state.location == "/login") {
      //   return '/home';
      // } else if (!loginInfo.loggedIn && loginInfo.initialized) {
      //   return '/login';
      // } else if (!loginInfo.userSelected && state.location == "/profile") {
      //   return '/home';
      // } else {
      //   return null;
      // }
      // -------------------------------------------- break point------------------------------------
      // if (!isInitialized && !isGoingToInit) {
      //   return '/splash';
      //   // If not onboard and not going to onboard redirect to OnBoarding
      // } else if (isLogedIn) {
      //   return null;
      // } else if (isInitialized && !isOnboarded && !isGoingToOnboard) {
      //   return '/login';
      //   // If not logedin and not going to login redirect to Login
      // } else if (isInitialized &&
      //     isOnboarded &&
      //     !isLogedIn &&
      //     !isGoingToLogin) {
      //   return '/login';
      //   // If all the scenarios are cleared but still going to any of that screen redirect to Home
      // } else if ((isLogedIn && isGoingToLogin) ||
      //     (isInitialized && isGoingToInit) ||
      //     (isOnboarded && isGoingToOnboard)) {
      //   return '/home';
      // } else {
      //   // Else Don't do anything
      //   return null;
      // }
    },
    debugLogDiagnostics: true,
    initialLocation: "/login",
    routes: [
      //TODO Splash page
      // GoRoute(
      //   name: "splash",
      //   path: '/splash',
      //   //redirect: (BuildContext context, GoRouterState state) {},
      //   pageBuilder: (context, state) => MaterialPage<void>(
      //     key: _pageKey,
      //     child: LoadingOverlay(
      //       key: state.pageKey,
      //       child: SplashPage(
      //         key: _scaffoldKey,
      //       ),
      //     ),
      //   ),
      // ),

      GoRoute(
        name: "login",
        path: '/login',
        //redirect: (BuildContext context, GoRouterState state) {},
        pageBuilder: (context, state) => MaterialPage<void>(
          key: _pageKey,
          child: LoadingOverlay(
            key: state.pageKey,
            child: LoginPage(
              loginInfo: loginInfo,
              key: _scaffoldKey,
            ),
          ),
        ),
      ),
      //TODO ForgotPassword page
      // GoRoute(
      //   name: "forgetPassword",
      //   path: '/forgetPassword',
      //   //redirect: (BuildContext context, GoRouterState state) {},
      //   pageBuilder: (context, state) => MaterialPage<void>(
      //     key: _pageKey,
      //     child: LoadingOverlay(
      //       key: state.pageKey,
      //       child: ForgetPasswordPage(
      //         loginInfo: loginInfo,
      //         key: _scaffoldKey,
      //       ),
      //     ),
      //   ),
      // ),

      GoRoute(
        name: "home",
        path: '/home',
        pageBuilder: (context, state) => MaterialPage<void>(
          key: _pageKey,
          child: LoadingOverlay(
            key: state.pageKey,
            child: RootLayout(
              loginInfo: loginInfo,
              key: _scaffoldKey,
              currentIndex: 0,
              child: MyHomePage(
                loginInfo: loginInfo,
                title: "Home Page",
                key: _scaffoldKey,
              ),
            ),
          ),
        ),
      ),

      //TODO profile page for ids
      // GoRoute(
      //   path: '/patient_profile:pid',
      //   pageBuilder: (context, state) => MaterialPage<void>(
      //     key: _pageKey,
      //     child: LoadingOverlay(
      //       key: state.pageKey,
      //       child: RootLayout(
      //         key: _scaffoldKey,
      //         currentIndex: 0,
      //         child: PatientProfilePage(
      //           key: _scaffoldKey,
      //         ),
      //       ),
      //     ),
      //   ),
      // ),
      // PlaylistHomeScreen
      // GoRoute(
      //   path: '/playlists',
      //   pageBuilder: (context, state) => MaterialPage<void>(
      //     key: _pageKey,
      //     child: RootLayout(
      //       key: _scaffoldKey,
      //       currentIndex: 1,
      //       child: MyHomePage(

      //         title: "1",
      //       ),
      //     ),
      //   ),
      //   routes: [
      //     GoRoute(
      //       path: ':pid',
      //       pageBuilder: (context, state) => MaterialPage<void>(
      //         key: state.pageKey,
      //         child: RootLayout(
      //           key: _scaffoldKey,
      //           currentIndex: 1,
      //           child: MyHomePage(
      //             tabIndex: state.params['tabIndex']!,
      //             title: "1",
      //           ),
      //         ),
      //       ),
      //     ),
      //   ],
      // ),

      // ArtistHomeScreen
      // GoRoute(
      //   path: '/artists',
      //   pageBuilder: (context, state) => MaterialPage<void>(
      //     key: _pageKey,
      //     child: RootLayout(
      //       key: _scaffoldKey,
      //       currentIndex: 2,
      //       child: MyHomePage(
      //         tabIndex: state.params['tabIndex']!,
      //         title: "Page Design",
      //       ),
      //     ),
      //   ),
      //   routes: [
      //     GoRoute(
      //       path: ':aid',
      //       pageBuilder: (context, state) => MaterialPage<void>(
      //         key: state.pageKey,
      //         child: RootLayout(
      //           key: _scaffoldKey,
      //           currentIndex: 2,
      //           child: MyHomePage(
      //             tabIndex: state.params['tabIndex']!,
      //             title: "1",
      //           ),
      //         ),
      //       ),
      //       // builder: (context, state) => ArtistScreen(
      //       //   id: state.params['aid']!,
      //       // ),
      //     ),
      //   ],
      // ),
      // for (final route in AppRouter(this.isLoggenIn).destinations.skip(3))
      //   GoRoute(
      //     path: route.route,
      //     pageBuilder: (context, state) => MaterialPage<void>(
      //       key: _pageKey,
      //       child: RootLayout(
      //         key: _scaffoldKey,
      //         currentIndex: destinations.indexOf(route),
      //         child: const SizedBox(),
      //       ),
      //     ),
      //   ),
    ],
  );
}
