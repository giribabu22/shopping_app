import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:pre_mart/features/app/splash_screen/splash_screen.dart';
import 'package:pre_mart/features/user_auth/presentation/pages/login.dart';


Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb){
    await Firebase.initializeApp(
      options: const FirebaseOptions(apiKey: "dsadadadd", appId: '1::web:', messagingSenderId: '12345678', projectId: 'pre-mart')
    );
  } else {
    await Firebase.initializeApp();
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const SplashScreen(
        child:  LoginPage()
      )
    );
  }
  
}
