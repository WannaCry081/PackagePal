import "package:flutter/material.dart";
import "package:firebase_core/firebase_core.dart";
import "package:frontend/routes.dart";
import "package:frontend/firebase_options.dart";

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
  return;
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "PackagePal",
        debugShowCheckedModeBanner: false,
        initialRoute: "/",
        routes: routes);
  }
}
