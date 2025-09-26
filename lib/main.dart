import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'blocs/counter_bloc.dart';
import 'pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // 👈 ESTA LÍNEA QUITA EL CARTEL "DEBUG"
      title: 'Actividad 2 - BLoC',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: BlocProvider(
        create: (_) => CounterBloc(maxValue: 5, minValue: -5),
        child: const HomePage(),
      ),
    );
  }
}
