import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
                  _featuredCard('Fotografia basica ', 'Por John Doe', 'lib/images/photo.jpg'),
                  const SizedBox(width: 16),
                  _featuredCard('Escritura creativa', 'Por Jane Smith', 'lib/images/writing.jpg'),
                  const SizedBox(width: 16),
                  _featuredCard('Matemáticas esenciales', 'Por Ana Torres', 'lib/images/matematicas.jpg'),
                  const SizedBox(width: 16),
                  _featuredCard('Física para todos', 'Por David Ríos', 'lib/images/fisica.jpg'),
                  const SizedBox(width: 16),
                  _featuredCard('Inglés básico', 'Por Lisa Green', 'lib/images/ingles.jpg'),
                  const SizedBox(width: 16),
                  _featuredCard('Programación con Dart', 'Por Enrique M.', 'lib/images/programacion.jpg'),
                  const SizedBox(width: 16),
                  _featuredCard('Diseño gráfico', 'Por Laura Pérez', 'lib/images/diseno.jpg'),
                  const SizedBox(width: 16),
                  _featuredCard('Fotografía avanzada', 'Por Juan Esteban', 'lib/images/foto_avanzada.jpg'),
                  const SizedBox(width: 16),
                  _featuredCard('Historia del arte', 'Por Camila Ruiz', 'lib/images/arte.jpg'),
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
            _recentClassCard('Marketing digital 101', 'Por Alex Johnson', 'lib/images/marketing.jpg'),
            const SizedBox(height: 12),
            _recentClassCard('Cocinar para principiantes', 'Por Chef Mike', 'lib/images/cooking.jpg'),
          ],
        ),
      ),

      // Bottom Navigation Bar
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        onTap: (index) {
          // Aquí puedes controlar la navegación
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

  Widget _featuredCard(String title, String author, String imagePath) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Container(
        width: 200,
        color: Colors.grey.shade100,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(imagePath, height: 100, width: 200, fit: BoxFit.cover),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(author, style: const TextStyle(color: Colors.grey)),
            ),
          ],
        ),
      ),
    );
  }

  Widget _recentClassCard(String title, String author, String imagePath) {
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
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
