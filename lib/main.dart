import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'src/app_state.dart';
import 'src/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => AppState(),
      child: MaterialApp(
        title: 'Local Market',
        theme: ThemeData(primarySwatch: Colors.teal),
        home: const HomeScreen(),
      ),
    );
  }
}
