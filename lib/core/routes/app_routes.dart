import 'package:firebase_chat/features/auth/presentation/screens/auth_screen.dart';
import 'package:firebase_chat/features/chat/presentation/screen/chat_screen.dart';
import 'package:go_router/go_router.dart';

class AppRoutes {
  static final GoRouter router = GoRouter(
    initialLocation: AuthScreen.routeName,
    routes: [
      GoRoute(
        path: AuthScreen.routeName,
        builder: (context, state) => AuthScreen(),
      ),
      GoRoute(
        path: ChatScreen.routeName,
        builder: (context, state) {
          var chatId = state.extra as String;
          return ChatScreen(
            chatId: chatId,
          );
        },
      ),
    ],
  );
}
