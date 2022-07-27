import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'package:flutter/services.dart';
import 'package:mypets/app/pages/home_page.dart';
import 'package:mypets/app/pages/login_page.dart';
=======
import 'app/pages/login_page.dart';
import 'firebase_options.dart';
>>>>>>> 06971d7a8f7f64514f510e3586a9bedb68cb902c

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
<<<<<<< HEAD
    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.immersiveSticky,
    );
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      routes: {
        "/": (context) => const LoginPage(),
        "/homePage": (context) => HomePage(),
      },
=======
    return MaterialApp(
      title: 'Flutter auth Demo',
      home: LoginPage(),
>>>>>>> 06971d7a8f7f64514f510e3586a9bedb68cb902c
    );
  }
}