import "package:flutter/material.dart";
import 'package:provider/provider.dart';
import 'controller/game_1_controller.dart';
import 'screens/HomeScreen/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      child: MaterialApp(
        home: HomeScreen(),
      ),
      providers: [
        ChangeNotifierProvider(
          create: (context) => Game1Controller(),
        ),
      ],
    );
  }
}
