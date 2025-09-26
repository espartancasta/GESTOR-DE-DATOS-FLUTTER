import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CitasPage extends StatelessWidget {
  const CitasPage({super.key});

  Future<void> _mostrarFormularioCita(BuildContext context, [DocumentSnapshot? doc]) async {
    final pacienteController = TextEditingController(text: doc?['paciente'] ?? '');
    final sintomaController = TextEditingController(text: doc?['sintoma'] ?? '');
    final fechaController = TextEditingController(text: doc?['fecha'] ?? '');

    await showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text(doc == null ? 'Agregar Cita' : 'Editar Cita'),
        content: SingleChildScrollView(
          child: Column(
            children: [
              TextField(
                controller: pacienteController,
                decoration: const InputDecoration(labelText: 'Paciente'),
              ),
              TextField(
                controller: sintomaController,
                decoration: const InputDecoration(labelText: 'Síntoma'),
              ),
              TextField(
                controller: fechaController,
                decoration: const InputDecoration(labelText: 'Fecha (YYYY-MM-DD)'),
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancelar'),
          ),
          ElevatedButton(
            onPressed: () async {
              final paciente = pacienteController.text.trim();
              final sintoma = sintomaController.text.trim();
              final fecha = fechaController.text.trim();
              if (paciente.isEmpty || sintoma.isEmpty || fecha.isEmpty) return;

              final collection = FirebaseFirestore.instance.collection('citas_prueba');
              try {
                if (doc == null) {
                  await collection.add({
                    'paciente': paciente,
                    'sintoma': sintoma,
                    'fecha': fecha,
                    'creadoEn': FieldValue.serverTimestamp(),
                  });
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('✅ Cita agregada correctamente')),
                  );
                } else {
                  await collection.doc(doc.id).update({
                    'paciente': paciente,
                    'sintoma': sintoma,
                    'fecha': fecha,
                  });
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('✏️ Cita actualizada correctamente')),
                  );
                }
                Navigator.pop(context);
              } catch (e) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Error: $e')),
                );
              }
            },
            child: Text(doc == null ? 'Guardar' : 'Actualizar'),
          ),
        ],
      ),
    );
  }

  Future<void> _eliminarCita(BuildContext context, String docId) async {
    try {
      await FirebaseFirestore.instance.collection('citas_prueba').doc(docId).delete();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('🗑️ Cita eliminada')),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error al eliminar: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Citas médicas (Firestore)')),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.teal,
        onPressed: () => _mostrarFormularioCita(context),
        tooltip: 'Agregar Cita',
        child: const Icon(Icons.add),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('citas_prueba')
            .orderBy('creadoEn', descending: true)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return const Center(child: Text('No hay citas registradas.'));
          }

          final docs = snapshot.data!.docs;
          return ListView.builder(
            padding: const EdgeInsets.all(8),
            itemCount: docs.length,
            itemBuilder: (context, i) {
              final d = docs[i];
              final data = d.data() as Map<String, dynamic>;
              return Card(
                elevation: 3,
                margin: const EdgeInsets.symmetric(vertical: 6),
                child: ListTile(
                  leading: const Icon(Icons.local_hospital, color: Colors.teal, size: 32),
                  title: Text(data['paciente'] ?? 'Sin nombre', style: const TextStyle(fontWeight: FontWeight.bold)),
                  subtitle: Text('Síntoma: ${data['sintoma'] ?? 'Sin síntoma'}\nFecha: ${data['fecha'] ?? 'Sin fecha'}'),
                  isThreeLine: true,
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.edit, color: Colors.orange),
                        onPressed: () => _mostrarFormularioCita(context, d),
                      ),
                      IconButton(
                        icon: const Icon(Icons.delete, color: Colors.red),
                        onPressed: () => _eliminarCita(context, d.id),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
