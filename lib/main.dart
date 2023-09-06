import 'package:flutter/material.dart';
import 'package:frontend/home_page.dart';
import 'package:frontend/presentation/screens/reservations/reservations.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FrontEnd Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.dark(),
        useMaterial3: true,
      ),
       home: HomePage(),
      //home: const ReservationsScreens(),
      debugShowCheckedModeBanner: false,
    );
  }
}
