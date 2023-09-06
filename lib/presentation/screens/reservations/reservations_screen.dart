import 'package:flutter/material.dart';
import 'package:frontend/presentation/providers/reservations_provider.dart';
import 'package:frontend/presentation/widgets/reservations/mis_pendientes.dart';
import 'package:frontend/presentation/widgets/shared/my_drawer.dart';
import 'package:provider/provider.dart';

class ReservationsScreens extends StatelessWidget {
  const ReservationsScreens({super.key});

  @override
  Widget build(BuildContext context) {
    // final ColorScheme colorScheme = Theme.of(context).colorScheme;
    // final Color oddItemColor = colorScheme.primary.withOpacity(0.05);
    // final Color evenItemColor = colorScheme.primary.withOpacity(0.15);
    final reservationProvier = context.watch<ReservationProvider>();
    if (reservationProvier.reservationList.isEmpty) {
      reservationProvier.reservationRequest();
    }
    const int tabsCount = 2;
    List<String> titles = <String>[
      'Pendientes',
      'Pasadas',
    ];
    return DefaultTabController(
      initialIndex: 0,
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
            ListView.builder(
              itemCount: reservationProvier.reservationList.length,
              itemBuilder: (BuildContext context, int index) {
                final reservation = reservationProvier.reservationList[index];
                if (!compareDates(reservation.date)) {
                  return MisPendientes(reservation: reservation);
                }
                return Container();
              },
            ),
            ListView.builder(
              itemCount: reservationProvier.reservationList.length,
              itemBuilder: (BuildContext context, int index) {
                final reservation = reservationProvier.reservationList[index];
                if (compareDates(reservation.date)) {
                  return MisPendientes(reservation: reservation);
                }
                return Container();
              },
            ),
          ],
        ),
      ),
    );
  }

  bool compareDates(String date) {
    final DateTime today = DateTime.now();
    final DateTime reservationDate = DateTime.parse('$date 00:00:00');
    if (today.isAfter(reservationDate)) {
      return true;
    }
    return false;
  }
}
