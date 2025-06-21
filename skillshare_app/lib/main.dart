import 'package:flutter/material.dart';
import 'package:skillshare_app/screens/savedScreen.dart';
import 'package:skillshare_app/screens/search_screen.dart';
import 'screens/welcome_screen.dart';
import 'screens/login_screen.dart';
import 'screens/register_screen.dart';
import 'screens/home_screen.dart';
import 'screens/profile_screen.dart';

void main() {
  runApp(const SkillShareApp());
}

class SkillShareApp extends StatelessWidget {
  const SkillShareApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SkillShare',
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
        routes: {
          '/': (context) => const WelcomeScreen(),
          '/login': (context) => const LoginScreen(),
          '/register': (context) => const RegisterScreen(),
          '/home': (context) => const HomeScreen(initialIndex: 0),
          '/search': (context) => const SearchScreen(initialIndex: 1),
          '/saved': (context) => const SavedScreen(initialIndex: 2),
          '/profile': (context) => const ProfileScreen(initialIndex: 3),
        }

    );
  }
}

