import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

// Importa tus pantallas aquí
//import '../screens/welcome_screen.dart';
//import '../screens/login_screen.dart';
//import '../screens/register_screen.dart';
//import '../screens/home_screen.dart';
import 'package:skillshare_app/screens/class_detail_screen.dart';

final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return ClassDetailScreen(
          title: 'Clase de Fotografía Básica',
          description: 'Aprende a manejar tu cámara y capturar imágenes increíbles.',
          date: '12 de junio, 2025',
          time: '5:00 PM',
          location: 'Centro Comercial Plaza Real',
        );
      },
    ),
    // Puedes agregar más rutas aquí
  ],
);