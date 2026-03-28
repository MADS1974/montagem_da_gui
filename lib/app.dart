import 'package:flutter/material.dart';
import 'screens/cadastro_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'IFSP Cadastro',
      theme: ThemeData(

        primarySwatch: Colors.green,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF32A02E),
          secondary: const Color(0xFFD52B1E),
        ),
        useMaterial3: true,
      ),
      home: const CadastroScreen(),
    );
  }
}