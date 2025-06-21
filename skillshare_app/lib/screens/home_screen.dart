import 'package:flutter/material.dart';
import 'package:skillshare_app/screens/saved_class.dart';
import 'package:skillshare_app/screens/saved_classes.dart';

import 'class_detail_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key, required int initialIndex});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bienvenido a SkillShare'),
        actions: const [
          Icon(Icons.notifications_none),
          SizedBox(width: 12),
          Icon(Icons.settings),
          SizedBox(width: 16),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Buscar
            TextField(
              decoration: InputDecoration(
                hintText: 'Buscar clases',
                prefixIcon: const Icon(Icons.search),
                filled: true,
                fillColor: Colors.grey.shade200,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(height: 24),

            // Featured Classes
            const Text(
              'Clases destacadas',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            SizedBox(
              height: 160,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  _featuredCard(context, 'Fotografia basica', 'John Doe', 'lib/images/photo.jpg'),
                  const SizedBox(width: 16),
                  _featuredCard(context, 'Escritura creativa', 'Jane Smith', 'lib/images/writing.jpg'),
                  const SizedBox(width: 16),
                  _featuredCard(context, 'Matemáticas esenciales', 'Ana Torres', 'lib/images/matematicas.jpg'),
                  const SizedBox(width: 16),
                  _featuredCard(context, 'Física para todos', 'David Ríos', 'lib/images/fisica.jpg'),
                  const SizedBox(width: 16),
                  _featuredCard(context, 'Inglés básico', 'Lisa Green', 'lib/images/ingles.jpg'),
                  const SizedBox(width: 16),
                  _featuredCard(context, 'Programación con Dart', 'Enrique M.', 'lib/images/programacion.jpg'),
                  const SizedBox(width: 16),
                  _featuredCard(context, 'Diseño gráfico', 'Laura Pérez', 'lib/images/diseno.jpg'),
                  const SizedBox(width: 16),
                  _featuredCard(context, 'Fotografía avanzada', 'Juan Esteban', 'lib/images/foto_avanzada.jpg'),
                  const SizedBox(width: 16),
                  _featuredCard(context, 'Historia del arte', 'Camila Ruiz', 'lib/images/arte.jpg'),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // Recent Classes
            const Text(
              'Clases recientes',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            _recentClassCard(context, 'Marketing digital 101', 'Alex Johnson', 'lib/images/marketing.jpg'),
            const SizedBox(height: 12),
            _recentClassCard(context, 'Cocinar para principiantes', 'Chef Mike', 'lib/images/cooking.jpg'),
          ],
        ),
      ),

      // Bottom Navigation Bar
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        selectedItemColor: Colors.blue, // Color azul al seleccionar
        unselectedItemColor: Colors.grey, // Color gris cuando no está seleccionado
        onTap: (index) {
          switch (index) {
            case 0:
              break;
            case 1:
              Navigator.pushNamed(context, '/search');
              break;
            case 2:
              Navigator.pushNamed(context, '/saved');
              break;
            case 3:
              Navigator.pushNamed(context, '/profile');
              break;
          }
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(icon: Icon(Icons.bookmark_border), label: 'Saved'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }

  Widget _featuredCard(BuildContext context, String title, String author, String imagePath) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Container(
        width: 200,
        color: Colors.grey.shade100,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const ClassDetailScreen(
                      title: 'Fotografía para Principiantes',
                      description: 'Aprende fotografía digital, composición y edición básica.',
                      date: '10 de Julio',
                      time: '3:00 PM',
                      location: 'Aula Virtual 4',
                    ),
                  ),
                );
              },
              child: Image.asset(imagePath, height: 100, width: 200, fit: BoxFit.cover),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(author, style: const TextStyle(color: Colors.grey)),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: IconButton(
                icon: const Icon(Icons.bookmark_border),
                onPressed: () {
                  savedClasses.add(SavedClass(title: title, author: author, imagePath: imagePath));
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Clase guardada')),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _recentClassCard(BuildContext context, String title, String author, String imagePath) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Container(
        color: Colors.grey.shade100,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(imagePath, width: double.infinity, height: 160, fit: BoxFit.cover),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
                  const SizedBox(height: 4),
                  Text(author, style: const TextStyle(color: Colors.grey)),
                  Align(
                    alignment: Alignment.centerRight,
                    child: IconButton(
                      icon: const Icon(Icons.bookmark_border),
                      onPressed: () {
                        savedClasses.add(SavedClass(
                          title: title,
                          author: author,
                          imagePath: imagePath,
                        ));
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Clase guardada')),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

}
