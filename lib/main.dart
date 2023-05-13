import 'package:breast_ia/screens/auth/auth_screen.dart';
import 'package:breast_ia/screens/home/home_screen.dart';
import 'package:breast_ia/screens/utils/main_bindings.dart';
import 'package:breast_ia/screens/utils/pages_app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FlutterError.onError = (errorDetails) {
    FirebaseCrashlytics.instance.recordFlutterFatalError(errorDetails);
  };
  PlatformDispatcher.instance.onError = (error, stack) {
    FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
    return true;
  };
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Breast IA',
      initialRoute: AuthScreen.routerName,
      getPages: PagesApp.screens,
      initialBinding: MainBindings(),
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
    );
  }
}
