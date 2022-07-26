import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mypets/app/pages/home_page.dart';
import 'package:mypets/app/pages/login_page.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.immersiveSticky,
    );
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      routes: {
        "/": (context) => const LoginPage(),
        "/homePage": (context) => const HomePage(),
      },
    );
  }
}
