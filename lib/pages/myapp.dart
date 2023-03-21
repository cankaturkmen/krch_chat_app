import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../shared/shared.dart';
import 'Home/myhomepage.dart';
import 'Login/login.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key, required this.sharedPreferences});
  final SharedPreferences sharedPreferences;
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late LoginInfo loginInfo;

  @override
  void initState() {
    loginInfo = LoginInfo(widget.sharedPreferences);

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  final settings = ValueNotifier(ThemeSettings(
    sourceColor: Colors.purple,
    themeMode: ThemeMode.system,
  ));
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => loginInfo),
          Provider<AppRouter>(create: (_) => AppRouter(loginInfo)),
        ],
        child: DynamicColorBuilder(
          builder: (lightDynamic, darkDynamic) => ThemeProvider(
              lightDynamic: lightDynamic,
              darkDynamic: darkDynamic,
              settings: settings,
              child: NotificationListener<ThemeSettingChange>(
                onNotification: (notification) {
                  settings.value = notification.settings;
                  return true;
                },
                child: ValueListenableBuilder<ThemeSettings>(
                  valueListenable: settings,
                  builder: (context, value, _) {
                    final GoRouter goRouter =
                        Provider.of<AppRouter>(context, listen: true).router;
                    final theme = ThemeProvider.of(context);
                    return MaterialApp.router(
                      debugShowCheckedModeBanner: false,
                      locale: const Locale('tr'),
                      title: 'KRCH Chat App',
                      theme: theme.light(settings.value.sourceColor),
                      darkTheme: theme.dark(settings.value.sourceColor),
                      themeMode: theme.themeMode(),
                      // routeInformationParser:
                      //     appRouter.router.routeInformationParser,
                      // routeInformationProvider:
                      //     appRouter.router.routeInformationProvider,
                      // routerDelegate: appRouter.router.routerDelegate,
                      routerConfig: goRouter,
                    );
                  },
                ),
              )),
        ));
  }
}
