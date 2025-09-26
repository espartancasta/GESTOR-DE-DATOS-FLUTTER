import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_core/firebase_core.dart'; // 🔹 Firebase
import 'blocs/counter_bloc.dart';
import 'pages/splash_page.dart';
import 'firebase_options.dart'; // 🔹 generado por FlutterFire CLI

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // 🔹 necesario para async antes de runApp
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  ); // 🔹 inicializa Firebase según la plataforma

  runApp(
    BlocProvider(
      create: (_) => CounterBloc(maxValue: 5, minValue: -5),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Actividad 2 - BLoC con Firebase',
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      home: const SplashPage(),
    );
  }
}
