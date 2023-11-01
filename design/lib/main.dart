import 'package:design/auth/firebase_auth_repository.dart';
import 'package:design/controllers/permissions_controller.dart';
import 'package:design/firebase_options.dart';
import 'package:design/screens/splash/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform)
      .then((value) => Get.put(AuthenticationRepository()));
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
  Get.put(GrantPermissions());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        inputDecorationTheme: InputDecorationTheme(
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
          ),
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.green,
        ),
        filledButtonTheme: const FilledButtonThemeData(
          style: ButtonStyle(
            elevation: MaterialStatePropertyAll(5),
          ),
        ),
        useMaterial3: true,
      ),
      home: const SplashScreen(),
    );
  }
}
