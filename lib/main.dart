import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:flornanda/providers/favorites_provider.dart';
import 'package:flornanda/providers/products_provider.dart';
import 'package:flornanda/screen/login_screen.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    const FlornandaApp(),
  );
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
        debugShowCheckedModeBanner: false,
        title: 'Flornanda Forminhas',
        theme: theme,
        home: const LoginScreen(),
      ),
    );
  }
}
