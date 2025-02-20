/*
 * Crea una aplicación de chat usando Firebase como tu backend.
 *
 * 
 * Requisitos:
 * - La aplicación tendrá una pantalla donde tendrás que hacer login con tu cuenta de Google.
 * - Una vez realizado, accederás a una sala de chat donde se visualizarán los mensajes
 *   de todos los usuarios y podrás interactuar con ellos.
 *
 * - ¡Punto extra! ¿Eres capaz de enviar notificaciones push a otro dispositivo
 *   cada vez que te escriben? ¿E imágenes?
 */

import 'package:firebase_chat/core/injectable/get_it_injector.dart';
import 'package:firebase_chat/core/routes/app_routes.dart';
import 'package:firebase_chat/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:firebase_chat/features/chat/presentation/bloc/chat_bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
//import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  // Ensure Initialized
  WidgetsFlutterBinding.ensureInitialized();

  configureDependencies();
  await Firebase.initializeApp();

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(MultiBlocProvider(providers: [
      BlocProvider<AuthBloc>(
        create: (context) => getItInjector.get<AuthBloc>(),
      ),
      BlocProvider<ChatBloc>(
        create: (context) => getItInjector.get<ChatBloc>(),
      ),
    ], child: const MyApp()));
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Firebase Chat',
      routerConfig: AppRoutes.router,
    );
  }
}
