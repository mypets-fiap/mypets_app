import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mypets/app/pages/signup.dart';
import 'package:mypets/app/pages/home_page.dart';
import 'package:mypets/app/pages/login_page.dart';
import 'package:mypets/database/pet_repository.dart';
import 'package:mypets/firebase_options.dart';
import 'package:mypets/model/pet.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  print("Salvando novo pet");
  PetRepository repository = PetRepository();
  var savePet = repository.savePet(new Pet('teste', 'gato', 'gatuno', DateTime.now(), 'pequeno', 'macho'));
  print(savePet);
  print("Pet salvo");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      routes: {
        "/": (context) => LoginPage(),
        "/homePage": (context) => const HomePage(),
        "/signUp": (context) => Signup(),
      },
    );
  }
}
