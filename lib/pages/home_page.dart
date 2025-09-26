import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/counter_bloc.dart';
import '../blocs/counter_event.dart';
import '../blocs/counter_state.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static const Color neonBlue = Color(0xFF00E5FF);
  static const Color neonPurple = Color(0xFF6C4CFF);
  static const Color panelBg = Color(0xFF071029);

  Widget neonButton({
    required String label,
    required VoidCallback onPressed,
    double width = 80,
  }) {
    return Container(
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: neonBlue.withOpacity(0.16),
            blurRadius: 16,
            spreadRadius: 1,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          backgroundColor: Colors.white.withOpacity(0.03),
          side: const BorderSide(color: Color(0xFF00E5FF), width: 1.2),
          shape: const StadiumBorder(),
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
          elevation: 0,
        ),
        child: Text(
          label,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
            letterSpacing: 0.6,
          ),
        ),
      ),
    );
  }

  // función helper para devolver colores según estado
  LinearGradient gradientForState(CounterStatus status) {
    switch (status) {
      case CounterStatus.maxReached:
        return const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFF0B1020), Color(0xFF120022)], // morado oscuro
        );
      case CounterStatus.minReached:
        return const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFF04060A), Color(0xFF1A0B0B)], // rojo oscuro suave
        );
      case CounterStatus.initial:
      case CounterStatus.normal:
        return const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFF071029), Color(0xFF001122)], // azul oscuro por defecto
        );
    }
  }

  Color accentForState(CounterStatus status) {
    switch (status) {
      case CounterStatus.maxReached:
        return neonPurple;
      case CounterStatus.minReached:
        return Colors.redAccent;
      case CounterStatus.initial:
      case CounterStatus.normal:
        return neonBlue;
    }
  }

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<CounterBloc>();

    return Scaffold(
      body: BlocBuilder<CounterBloc, CounterState>(
        builder: (context, state) {
          final gradient = gradientForState(state.status);
          final accent = accentForState(state.status);

          String subtitle;
          switch (state.status) {
            case CounterStatus.initial:
              subtitle = 'Valor inicial.';
              break;
            case CounterStatus.normal:
              subtitle = 'Estado normal.';
              break;
            case CounterStatus.maxReached:
              subtitle = '¡Máximo alcanzado!';
              break;
            case CounterStatus.minReached:
              subtitle = '¡Mínimo alcanzado!';
              break;
          }

          return Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              gradient: gradient,
            ),
            child: Stack(
              children: [
                // neon glow decorativo adaptado al estado
                Positioned(
                  right: -120,
                  top: -80,
                  child: Container(
                    width: 300,
                    height: 300,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: RadialGradient(
                        colors: [accent.withOpacity(0.14), Colors.transparent],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: -80,
                  bottom: -60,
                  child: Container(
                    width: 260,
                    height: 260,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: RadialGradient(
                        colors: [accent.withOpacity(0.08), Colors.transparent],
                      ),
                    ),
                  ),
                ),

                Center(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        const SizedBox(height: 32),
                        Text(
                          'Actividad 2 - Gestor de estados',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            shadows: [
                              BoxShadow(
                                color: accent.withOpacity(0.22),
                                blurRadius: 18,
                                spreadRadius: 1,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 46),

                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 20),
                          padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 22),
                          decoration: BoxDecoration(
                            color: panelBg.withOpacity(0.6),
                            borderRadius: BorderRadius.circular(18),
                            border: Border.all(color: Colors.white.withOpacity(0.04)),
                            boxShadow: [
                              BoxShadow(
                                color: accent.withOpacity(0.06),
                                blurRadius: 30,
                                spreadRadius: 2,
                                offset: const Offset(0, 10),
                              ),
                            ],
                            gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                panelBg.withOpacity(0.6),
                                panelBg.withOpacity(0.45),
                              ],
                            ),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const SizedBox(height: 6),
                              Text(
                                'Contador:',
                                style: TextStyle(
                                  color: Colors.white.withOpacity(0.9),
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const SizedBox(height: 10),
                              Text(
                                '${state.value}',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 54,
                                  fontWeight: FontWeight.w700,
                                  shadows: [
                                    BoxShadow(
                                      color: accent.withOpacity(0.28),
                                      blurRadius: 28,
                                      spreadRadius: 1,
                                    ),
                                    BoxShadow(
                                      color: accent.withOpacity(0.14),
                                      blurRadius: 50,
                                      spreadRadius: 2,
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 10),
                              Text(
                                subtitle,
                                style: TextStyle(
                                  color: Colors.white.withOpacity(0.75),
                                  fontSize: 14,
                                ),
                              ),
                              const SizedBox(height: 22),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  // decrement
                                  Container(
                                    width: 64,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30),
                                      boxShadow: [
                                        BoxShadow(
                                          color: accent.withOpacity(0.12),
                                          blurRadius: 12,
                                          offset: const Offset(0, 6),
                                        ),
                                      ],
                                    ),
                                    child: OutlinedButton(
                                      onPressed: () => bloc.add(DecrementEvent()),
                                      style: OutlinedButton.styleFrom(
                                        backgroundColor: Colors.white.withOpacity(0.02),
                                        side: BorderSide(color: accent.withOpacity(0.9), width: 1.2),
                                        shape: const StadiumBorder(),
                                        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
                                      ),
                                      child: const Text(
                                        '-',
                                        style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
                                      ),
                                    ),
                                  ),

                                  const SizedBox(width: 14),

                                  // reset (accent)
                                  Container(
                                    width: 110,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30),
                                      boxShadow: [
                                        BoxShadow(
                                          color: accent.withOpacity(0.16),
                                          blurRadius: 18,
                                          offset: const Offset(0, 8),
                                        ),
                                      ],
                                    ),
                                    child: ElevatedButton(
                                      onPressed: () => bloc.add(ResetEvent()),
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: accent.withOpacity(0.12),
                                        side: BorderSide(color: accent.withOpacity(0.95), width: 1.2),
                                        shape: const StadiumBorder(),
                                        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 6),
                                        elevation: 0,
                                      ),
                                      child: const Text(
                                        'Reset',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ),
                                  ),

                                  const SizedBox(width: 14),

                                  // increment
                                  Container(
                                    width: 64,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30),
                                      boxShadow: [
                                        BoxShadow(
                                          color: accent.withOpacity(0.12),
                                          blurRadius: 12,
                                          offset: const Offset(0, 6),
                                        ),
                                      ],
                                    ),
                                    child: OutlinedButton(
                                      onPressed: () => bloc.add(IncrementEvent()),
                                      style: OutlinedButton.styleFrom(
                                        backgroundColor: Colors.white.withOpacity(0.02),
                                        side: BorderSide(color: accent.withOpacity(0.9), width: 1.2),
                                        shape: const StadiumBorder(),
                                        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
                                      ),
                                      child: const Text(
                                        '+',
                                        style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
                                      ),
                                    ),
                                  ),
                                ],
                              ),

                              const SizedBox(height: 22),
                              Text(
                                'Eventos: Incrementar, Decrementar, Reiniciar.',
                                style: TextStyle(
                                  color: Colors.white.withOpacity(0.7),
                                  fontSize: 13,
                                ),
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(height: 40),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.flash_on, color: accent.withOpacity(0.9)),
                            const SizedBox(width: 8),
                            Text(
                              'Cyber Mode ON',
                              style: TextStyle(
                                color: accent.withOpacity(0.9),
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 80),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
