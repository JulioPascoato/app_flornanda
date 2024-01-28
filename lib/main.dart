import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:flornanda/providers/favorites_provider.dart';
import 'package:flornanda/providers/products_provider.dart';
import 'package:flornanda/screen/login_screen.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const FlornandaApp());
}

final ColorScheme colorScheme = ColorScheme.fromSeed(
  seedColor: Colors.blue.shade600,
);

final theme = ThemeData().copyWith(
  //useMaterial3: true,

  colorScheme: colorScheme,
  appBarTheme: AppBarTheme(
    backgroundColor: colorScheme.primary,
    foregroundColor: colorScheme.onPrimary,
  ),
  inputDecorationTheme: const InputDecorationTheme(
    border: OutlineInputBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(15.0),
      ),
    ),
  ),

  textTheme: GoogleFonts.latoTextTheme(),
);

class FlornandaApp extends StatelessWidget {
  const FlornandaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ProductProvider>(
          create: (context) => ProductProvider(),
        ),
        ChangeNotifierProvider<FavoritesProvider>(
          create: (context) => FavoritesProvider(),
        )
      ],
      child: MaterialApp(
        title: 'Flornanda Forminhas',
        theme: theme,
        // TOBE definided: A rota correta das página produtos será efetuada após o firebase retornar o usuario authenticado
        // sem a implementação dessa funcionalidade foi efetuado uma rota com pushReplacement.
        // basta clicar no botão de login para avançar na aplicação.
        home: const LoginScreen(),
      ),
    );
  }
}
