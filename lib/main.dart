import 'package:flutter/material.dart';
import 'theme.dart';
import 'screens/login_screen.dart';
import 'screens/shell.dart';

void main() => runApp(const IsetApp());

class IsetApp extends StatelessWidget {
  const IsetApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ISET Community',
      debugShowCheckedModeBanner: false,
      theme: buildTheme(),
      initialRoute: '/login',
      routes: {
        '/login': (_) => const LoginScreen(),
        '/app': (ctx) => AppShell(
              isGuest: (ModalRoute.of(ctx)!.settings.arguments as bool?) ?? false,
            ),
      },
    );
  }
}
