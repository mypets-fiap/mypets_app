import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:mypets/app/pages/cadastro_pet_page.dart';
import 'package:mypets/app/pages/home_page.dart';
import 'package:mypets/app/pages/login_page.dart';
import 'package:mypets/app/pages/signup.dart';
import 'package:mypets/firebase_options.dart';
import 'package:mypets/injection.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  setupInjection();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate
      ],
      supportedLocales: const [Locale('pt', 'BR')],
      builder: (BuildContext context, Widget? child) {
        return SafeArea(child: child!);
      },
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      routes: {
        "/": (context) => LoginPage(),
        "/homePage": (context) => const HomePage(),
        "/signUp": (context) => const Signup(),
        "/cadastroPet": (context) => const CadastroPetPage(),
      },
    );
  }
}
