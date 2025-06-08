import 'package:flutter/material.dart';

class ClassDetailScreen extends StatelessWidget {
  final String title;
  final String description;
  final String date;
  final String time;
  final String location;

  const ClassDetailScreen({
    Key? key,
    required this.title,
    required this.description,
    required this.date,
    required this.time,
    required this.location,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Clase de Fotografía'),
        backgroundColor: Colors.deepPurple,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Imagen destacada
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  'lib/images/fotografia.jpg',  // ruta relativa a la imagen local
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 16),

              // Título
              const Text(
                'Fotografía para Principiantes',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),

              // Nombre del instructor
              const Text(
                'Instructor: Camila Rodríguez',
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
              const SizedBox(height: 16),

              // Descripción
              const Text(
                'Aprende los fundamentos de la fotografía digital, manejo de cámara, composición y edición básica. Esta clase es ideal para quienes desean comenzar en el mundo de la fotografía con una guía práctica y ejemplos reales.',
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 24),

              // Botón de inscripción
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Te has inscrito en la clase 🎉'),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurple,
                    padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    'Inscribirse',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
