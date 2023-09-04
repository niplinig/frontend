import 'package:flutter/material.dart';
import 'package:frontend/presentation/widgets/reservations/mis_pendientes.dart';
import 'package:frontend/presentation/widgets/shared/my_drawer.dart';

class ReservationsScreens extends StatelessWidget {
  const ReservationsScreens({super.key});

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final Color oddItemColor = colorScheme.primary.withOpacity(0.05);
    final Color evenItemColor = colorScheme.primary.withOpacity(0.15);
    const int tabsCount = 2;
    List<String> titles = <String>[
      'Pendientes',
      'Pasadas',
    ];
    return DefaultTabController(
      initialIndex: 1,
      length: tabsCount,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Reservas'),
          centerTitle: true,
          notificationPredicate: (ScrollNotification notification) {
            return notification.depth == 1;
          },
          scrolledUnderElevation: 4.0,
          shadowColor: Theme.of(context).shadowColor,
          bottom: TabBar(
            tabs: <Widget>[
              Tab(
                text: titles[0],
              ),
              Tab(
                text: titles[1],
              ),
            ],
          ),
        ),
        drawer: const MyDrawer(),
        body: TabBarView(
          children: <Widget>[
            const MisPendientes(),
            ListView.builder(
              itemCount: 10,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  tileColor: index.isOdd ? oddItemColor : evenItemColor,
                  title: Text('${titles[1]} $index'),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
