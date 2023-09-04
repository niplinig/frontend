import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  navigateTo(String route, BuildContext context) {
    Navigator.of(context).pushReplacementNamed(route);
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: const EdgeInsets.all(16.0),
        children: <Widget>[
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Inicio'),
            onTap: () {
              navigateTo("/home", context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.fact_check),
            title: const Text('Reservaciones'),
            onTap: () {
              navigateTo("/reservations", context);
            },
          ),
        ],
      ),
    );
  }
}
