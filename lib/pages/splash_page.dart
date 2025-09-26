import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/counter_bloc.dart';
import 'home_page.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    const Color neonBlue = Color(0xFF00E5FF);
    const Color neonPurple = Color(0xFF6C4CFF);

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFF02030B),
              Color(0xFF061028),
            ],
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            const Spacer(flex: 3),
            // Logo estilo cyberpunk
            Container(
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: const RadialGradient(
                  colors: [Color(0xFF0FF0FF), Color(0x00000000)],
                ),
                boxShadow: [
                  BoxShadow(
                    color: neonBlue.withOpacity(0.18),
                    blurRadius: 30,
                    spreadRadius: 6,
                  ),
                ],
              ),
              child: Icon(Icons.memory, size: 64, color: neonPurple.withOpacity(0.95)),
            ),
            const SizedBox(height: 22),
            Text(
              'ACTIVIDAD 2',
              style: TextStyle(
                color: neonBlue.withOpacity(0.95),
                fontWeight: FontWeight.w800,
                letterSpacing: 2.0,
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Gestor de estados',
              style: TextStyle(color: Colors.white.withOpacity(0.8)),
            ),
            const Spacer(flex: 2),
            // Botón PRESS START
            OutlinedButton(
              onPressed: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (_) => BlocProvider(
                      create: (_) => CounterBloc(maxValue: 5, minValue: -5),
                      child: const HomePage(),
                    ),
                  ),
                );
              },
              style: OutlinedButton.styleFrom(
                backgroundColor: Colors.white.withOpacity(0.02),
                side: BorderSide(color: neonBlue.withOpacity(0.8), width: 1.3),
                padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 28),
                shape: const StadiumBorder(),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.play_arrow, color: neonBlue.withOpacity(0.95)),
                  const SizedBox(width: 10),
                  Text(
                    'PRESS START',
                    style: TextStyle(
                      color: neonBlue.withOpacity(0.95),
                      fontWeight: FontWeight.w700,
                      letterSpacing: 1.2,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
