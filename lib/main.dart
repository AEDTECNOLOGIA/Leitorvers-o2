import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart'; // ADICIONADO!
import 'package:google_fonts/google_fonts.dart';
import 'screens/splash_screen.dart';
import 'screens/login_screen.dart';
import 'screens/sign_up_screen.dart';
import 'screens/user_type_selection_screen.dart';
import 'screens/forgot_password_screen.dart';
import 'screens/reader_screen.dart';

<<<<<<< HEAD
=======

>>>>>>> 7d3cdea0458b658c32447f4485123d900f153cf2
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App de Leitura Inclusivo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF8A61A9), // Roxo
          secondary: const Color(0xFF44C3E0), // Azul
        ),
        useMaterial3: true,
        fontFamily: GoogleFonts.lexend().fontFamily, // Fonte Lexend
        textTheme: TextTheme(
          bodyLarge: GoogleFonts.lexend(
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
          bodyMedium: GoogleFonts.lexend(
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
      initialRoute: '/splash',
      routes: {
        '/': (context) => const LoginScreen(userType: 'responsável'),
        '/splash': (context) => const SplashScreen(),
        '/login': (context) => const LoginScreen(userType: 'responsável'),
        '/signup': (context) => const SignUpScreen(),
        '/forgot_password': (context) => const ForgotPasswordScreen(),
        '/user_type_selection': (context) =>
            const UserTypeSelectionScreen(userType: 'default'),
<<<<<<< HEAD
        '/leitor': (context) => const ReaderScreen(),
=======
        '/reader': (context) => const ReaderScreen(),
>>>>>>> 7d3cdea0458b658c32447f4485123d900f153cf2
      },
      debugShowCheckedModeBanner: false,
      builder: (context, child) {
        return MediaQuery(
          data: MediaQuery.of(
            context,
          ).copyWith(textScaler: TextScaler.linear(1.0)),
          child: child!,
        );
      },
    );
  }
}

// A classe HomeScreen pode ser movida para outro arquivo ou excluída, se não for usada
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Minha Biblioteca'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: const Center(
        child: Text(
          'Bem-vindo ao App de Leitura!',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
