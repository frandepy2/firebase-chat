import 'package:firebase_chat/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:firebase_chat/features/chat/presentation/screen/chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AuthScreen extends StatefulWidget {
  static const routeName = '/auth';
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state.status == AuthStatus.error) {
          print('Error');
        }
        if (state.status == AuthStatus.authenticated) {
          context.go(ChatScreen.routeName, extra: "chatId_123");
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: Text(
                      "Firebase ChatApp",
                      style: GoogleFonts.roboto(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  const SizedBox(
                    height: 20,
                  ),
                  Lottie.asset(
                    'assets/lottie/Animation.json',
                  ),

                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ),
          bottomNavigationBar: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 32.0, horizontal: 16),
              child: ElevatedButton(
                onPressed: () {
                  context.read<AuthBloc>().add(AuthEvent.login());
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue, // Color de fondo
                  foregroundColor: Colors.white, // Color del texto/icono
                  padding: EdgeInsets.symmetric(
                      horizontal: 24, vertical: 12), // Padding interno
                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(2), // Bordes redondeados
                  ),
                  elevation: 5, // Sombra
                  textStyle: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    FaIcon(FontAwesomeIcons.google, color: Colors.white,), 
                    SizedBox(width: 8), // Espacio entre icono y texto
                    Text("Login con Google",
                        style: TextStyle(color: Colors.white)),
                  ],
                ),
              )),
        );
      },
    );
  }
}
