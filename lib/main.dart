import 'package:arriada_group/screens/auth_screens/login_screen.dart';
import 'package:arriada_group/screens/auth_screens/register_screen.dart';
import 'package:arriada_group/screens/main_screens/details_screens.dart';
import 'package:arriada_group/screens/main_screens/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  FirebaseAuth auth = FirebaseAuth.instance;

  // const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: const LoginScreen(),

      home: auth.currentUser != null ? const HomeScreen() : const LoginScreen(),
    );
  }
}
