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
        gradient: const LinearGradient(
          colors: [Colors.transparent, Colors.transparent],
        ),
      ),
      child: OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          backgroundColor: Colors.white.withOpacity(0.03),
          side: const BorderSide(color: neonBlue, width: 1.2),
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

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<CounterBloc>();

    return Scaffold(
<<<<<<< HEAD
      // fondo degradado ciberpunk.
=======
>>>>>>> b882050 ( GESTOR CON 2 ESTADOS)
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFF01020A),
              Color(0xFF061028),
              Color(0xFF071029),
              Color(0xFF071029),
            ],
            stops: [0.0, 0.3, 0.6, 1.0],
          ),
        ),
        child: Stack(
          children: [
<<<<<<< HEAD
            // elementos decorativos neon (circulos suaves).
=======
>>>>>>> b882050 ( GESTOR CON 2 ESTADOS)
            Positioned(
              right: -100,
              top: -80,
              child: Container(
                width: 300,
                height: 300,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: RadialGradient(
                    colors: [neonPurple.withOpacity(0.12), Colors.transparent],
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
                    colors: [neonBlue.withOpacity(0.08), Colors.transparent],
                  ),
                ),
              ),
            ),
<<<<<<< HEAD

            // contenido principal.
=======
>>>>>>> b882050 ( GESTOR CON 2 ESTADOS)
            Center(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(height: 32),
<<<<<<< HEAD
                    // título con glow.
=======
>>>>>>> b882050 ( GESTOR CON 2 ESTADOS)
                    Text(
                      'Actividad 2 - Gestor de estados',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        shadows: [
                          BoxShadow(
                            color: neonBlue.withOpacity(0.22),
                            blurRadius: 18,
                            spreadRadius: 1,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 46),
<<<<<<< HEAD

                    // panel central estilo 'glass / neon card'.
=======
>>>>>>> b882050 ( GESTOR CON 2 ESTADOS)
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 22),
                      decoration: BoxDecoration(
                        color: panelBg.withOpacity(0.6),
                        borderRadius: BorderRadius.circular(18),
                        border: Border.all(color: Colors.white.withOpacity(0.04)),
                        boxShadow: [
                          BoxShadow(
                            color: neonBlue.withOpacity(0.06),
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
                      child: BlocBuilder<CounterBloc, CounterState>(
                        builder: (context, state) {
                          String subtitle;
                          switch (state.status) {
                            case CounterStatus.initial:
                              subtitle = 'Valor inicial.';
                              break;
                            case CounterStatus.normal:
                              subtitle = 'Estado normal.';
                              break;
                            case CounterStatus.maxReached:
                              subtitle = 'Máximo alcanzado.';
                              break;
                            case CounterStatus.minReached:
                              subtitle = 'Mínimo alcanzado.';
                              break;
                          }

                          return Column(
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
<<<<<<< HEAD
                              // valor con estilo neon.
=======
>>>>>>> b882050 ( GESTOR CON 2 ESTADOS)
                              Text(
                                '${state.value}',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 54,
                                  fontWeight: FontWeight.w700,
                                  shadows: [
                                    BoxShadow(
                                      color: neonBlue.withOpacity(0.28),
                                      blurRadius: 28,
                                      spreadRadius: 1,
                                    ),
                                    BoxShadow(
                                      color: neonPurple.withOpacity(0.14),
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
<<<<<<< HEAD

                              // botones con estilo futurista.
=======
>>>>>>> b882050 ( GESTOR CON 2 ESTADOS)
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  neonButton(
                                    label: '-',
                                    onPressed: () => bloc.add(DecrementEvent()),
                                    width: 64,
                                  ),
                                  const SizedBox(width: 14),
<<<<<<< HEAD
                                  // reset con estilo diferente (accent purple).
=======
>>>>>>> b882050 ( GESTOR CON 2 ESTADOS)
                                  Container(
                                    width: 110,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30),
                                      boxShadow: [
                                        BoxShadow(
                                          color: neonPurple.withOpacity(0.16),
                                          blurRadius: 18,
                                          offset: const Offset(0, 8),
                                        ),
                                      ],
                                    ),
                                    child: ElevatedButton(
                                      onPressed: () => bloc.add(ResetEvent()),
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: neonPurple.withOpacity(0.16),
                                        side: BorderSide(color: neonPurple.withOpacity(0.9), width: 1.2),
                                        shape: const StadiumBorder(),
                                        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 6),
                                        elevation: 0,
                                      ),
                                      child: Text(
                                        'Reset',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 14),
                                  neonButton(
                                    label: '+',
                                    onPressed: () => bloc.add(IncrementEvent()),
                                    width: 64,
                                  ),
                                ],
                              ),
<<<<<<< HEAD

=======
>>>>>>> b882050 ( GESTOR CON 2 ESTADOS)
                              const SizedBox(height: 22),
                              Text(
                                'Eventos: Incrementar, Decrementar, Reiniciar.',
                                style: TextStyle(
                                  color: Colors.white.withOpacity(0.7),
                                  fontSize: 13,
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
<<<<<<< HEAD

                    const SizedBox(height: 40),

                    // pie con iconos y efectos neon.
=======
                    const SizedBox(height: 40),
>>>>>>> b882050 ( GESTOR CON 2 ESTADOS)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.flash_on, color: neonBlue.withOpacity(0.9)),
                        const SizedBox(width: 8),
                        Text(
                          'Cyber Mode ON',
                          style: TextStyle(
                            color: neonBlue.withOpacity(0.9),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
<<<<<<< HEAD

=======
>>>>>>> b882050 ( GESTOR CON 2 ESTADOS)
                    const SizedBox(height: 80),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
