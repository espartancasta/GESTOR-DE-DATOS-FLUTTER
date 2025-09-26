import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Citas médicas (Firestore)'),
        backgroundColor: Colors.teal,
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('citas_prueba').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return const Center(child: Text('No hay citas registradas.'));
          }

          final citas = snapshot.data!.docs;

          return ListView.builder(
            itemCount: citas.length,
            itemBuilder: (context, index) {
              final cita = citas[index].data() as Map<String, dynamic>;
              final paciente = cita['paciente'] ?? 'Sin nombre';
              final sintoma = cita['sintoma'] ?? 'Sin síntoma';
              final fecha = cita['fecha'] ?? 'Sin fecha';

              return ListTile(
                leading: const Icon(Icons.local_hospital, color: Colors.teal),
                title: Text('Paciente $paciente'),
                subtitle: Text('Síntoma: $sintoma\nFecha: $fecha'),
              );
            },
          );
        },
      ),
    );
  }
}
