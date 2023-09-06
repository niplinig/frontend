import 'package:flutter/material.dart';
import 'package:frontend/home_page.dart';
import 'package:frontend/presentation/providers/reservations_provider.dart';
import 'package:frontend/presentation/screens/reservations/reservations_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => ReservationProvider())],
      child: MaterialApp(
        routes: <String, WidgetBuilder>{
          "/home": (BuildContext context) => HomePage(),
          "/reservations": (BuildContext context) =>
              const ReservationsScreens(),
        },
        initialRoute: "/home",
        title: 'FrontEnd Demo',
        theme: ThemeData(
          colorScheme: const ColorScheme.dark(),
          useMaterial3: true,
        ),
        home: HomePage(),
        //home: const ReservationsScreens(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
