import 'package:flutter/material.dart';
import 'package:skillshare_app/screens/saved_class.dart';
import 'package:skillshare_app/screens/saved_classes.dart';
import 'class_detail_screen.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key, required int initialIndex});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  String query = '';

  final List<Map<String, String>> allClasses = [
    {
      'title': 'Fotografía básica',
      'author': 'John Doe',
      'image': 'lib/images/photo.jpg',
    },
    {
      'title': 'Escritura creativa',
      'author': 'Jane Smith',
      'image': 'lib/images/writing.jpg',
    },
    {
      'title': 'Matemáticas esenciales',
      'author': 'Ana Torres',
      'image': 'lib/images/matematicas.jpg',
    },
    {
      'title': 'Física para todos',
      'author': 'David Ríos',
      'image': 'lib/images/fisica.jpg',
    },
    {
      'title': 'Inglés básico',
      'author': 'Lisa Green',
      'image': 'lib/images/ingles.jpg',
    },
    {
      'title': 'Programación con Dart',
      'author': 'Enrique M.',
      'image': 'lib/images/programacion.jpg',
    },
    {
      'title': 'Diseño gráfico',
      'author': 'Laura Pérez',
      'image': 'lib/images/diseno.jpg',
    },
    {
      'title': 'Fotografía avanzada',
      'author': 'Juan Esteban',
      'image': 'lib/images/foto_avanzada.jpg',
    },
    {
      'title': 'Historia del arte',
      'author': 'Camila Ruiz',
      'image': 'lib/images/arte.jpg',
    },
  ];

  @override
  Widget build(BuildContext context) {
    final filtered = allClasses.where((clase) {
      final title = clase['title']!.toLowerCase();
      final author = clase['author']!.toLowerCase();
      return title.contains(query.toLowerCase()) || author.contains(query.toLowerCase());
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Buscar clases'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              onChanged: (value) => setState(() => query = value),
              decoration: InputDecoration(
                hintText: 'Buscar por título o instructor',
                prefixIcon: const Icon(Icons.search),
                filled: true,
                fillColor: Colors.grey.shade200,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
          Expanded(
            child: filtered.isEmpty
                ? const Center(
              child: Text(
                'No se encontraron clases',
                style: TextStyle(color: Colors.grey, fontSize: 16),
              ),
            )
                : ListView.builder(
              itemCount: filtered.length,
              itemBuilder: (context, index) {
                final clase = filtered[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => ClassDetailScreen(
                          title: clase['title']!,
                          description: 'Clase dictada por ${clase['author']}',
                          date: 'Por definir',
                          time: 'Por definir',
                          location: 'Virtual',
                        ),
                      ),
                    );
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade100,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
                          child: Image.asset(
                            clase['image']!,
                            height: 150,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(12),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                clase['title']!,
                                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                'Por ${clase['author']}',
                                style: const TextStyle(color: Colors.grey),
                              ),
                            ],
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: IconButton(
                            icon: const Icon(Icons.bookmark_border),
                            onPressed: () {
                              savedClasses.add(SavedClass(
                                title: clase['title']!,
                                author: clase['author']!,
                                imagePath: clase['image']!,
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
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 1,
        selectedItemColor: Colors.blue, // Color azul al seleccionar
        unselectedItemColor: Colors.grey, // Color gris cuando no está seleccionado
        onTap: (index) {
          switch (index) {
            case 0:
              Navigator.pushNamed(context, '/home');
              break;
            case 1:
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
}
