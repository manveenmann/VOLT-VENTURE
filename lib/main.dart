import 'package:ev_app/screens/Authentication/Home/home-page.dart';
import 'package:ev_app/screens/Authentication/login.dart';
import 'package:ev_app/screens/Authentication/register.dart';
import 'package:ev_app/screens/Authentication/splash.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'firebase_options.dart';

main() async

 {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MainApp());
}
class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
 
    return MaterialApp(
     debugShowCheckedModeBanner: false,
   
      initialRoute: "/",
         routes: {
       "/": (context) => const Splash(),
         "/register": (context) => const RegisterPage(),
         "/login": (context) => const LoginPage(),
         "/home": (context) => const HomePage(),
         
        
        
      //"/loginForm": (context) => const LoginPageForm(),
       
      },
   
      
    );
  }
}