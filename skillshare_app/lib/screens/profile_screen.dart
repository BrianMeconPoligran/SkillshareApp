import 'package:flutter/material.dart';
import 'edit_profile_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key, required int initialIndex});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Perfil')),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            const CircleAvatar(
              radius: 40,
              backgroundImage: AssetImage('lib/images/profile.jpg'), // tu imagen de perfil
            ),
            const SizedBox(height: 10),
            const Text('John Smith', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const Text('Accountant', style: TextStyle(color: Colors.grey)),

            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                Column(
                  children: [
                    Icon(Icons.play_circle_outline),
                    SizedBox(height: 5),
                    Text('My\nClasses', textAlign: TextAlign.center),
                  ],
                ),
                Column(
                  children: [
                    Icon(Icons.library_books),
                    SizedBox(height: 5),
                    Text('Enrolled'),
                  ],
                ),
                Column(
                  children: [
                    Icon(Icons.favorite_border),
                    SizedBox(height: 5),
                    Text('Wishlist'),
                  ],
                ),
                Column(
                  children: [
                    Icon(Icons.settings),
                    SizedBox(height: 5),
                    Text('Settings'),
                  ],
                ),
              ],
            ),

            const SizedBox(height: 40),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const EditProfileScreen()),
                  );
                },
                child: const Text('Edit Profile'),
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                onPressed: () {
                  Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
                },
                child: const Text('Log Out'),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 3,
        selectedItemColor: Colors.blue, // Color azul al seleccionar
        unselectedItemColor: Colors.grey, // Color gris cuando no está seleccionado
        onTap: (index) {
          switch (index) {
            case 0: Navigator.pushNamed(context, '/home'); break;
            case 1: Navigator.pushNamed(context, '/search'); break;
            case 2: Navigator.pushNamed(context, '/saved'); break;
            case 3: break;
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
