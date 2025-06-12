import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/item_provider.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => ItemProvider()..loadItems(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Item App',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        scaffoldBackgroundColor: Colors.grey[100],
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          elevation: 2,
          titleTextStyle: TextStyle(
            color: Colors.teal,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
          iconTheme: IconThemeData(color: Colors.teal),
        ),
        cardTheme: CardTheme(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          elevation: 3,
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          color: Colors.white,
        ),
        textTheme: const TextTheme(
          titleMedium: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          bodyMedium: TextStyle(fontSize: 16, color: Colors.black87),
        ),
        iconTheme: const IconThemeData(color: Colors.teal),
        listTileTheme: const ListTileThemeData(
          iconColor: Colors.teal,
          textColor: Colors.black,
        ),
      ),
      home: const HomeScreen(),
    );
  }
}
