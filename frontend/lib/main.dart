import "package:flutter/material.dart";
import "package:provider/provider.dart";
import "package:firebase_core/firebase_core.dart";
import "package:frontend/routes.dart";
import "package:frontend/firebase_options.dart";
import "package:frontend/core/constants/light_theme.dart";
import "package:frontend/core/constants/dark_theme.dart";
import "package:frontend/core/providers/settings_provider.dart";

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => SettingsProvider())
  ], child: const MyApp()));
  return;
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final settings = Provider.of<SettingsProvider>(context);
    final isDark = settings.getBoolPreference("isDark");

    return MaterialApp(
        title: "PackagePal",
        debugShowCheckedModeBanner: false,
        theme: lightTheme,
        darkTheme: darkTheme,
        themeMode: (isDark) ? ThemeMode.dark : ThemeMode.light,
        initialRoute: "/",
        routes: routes);
  }
}
