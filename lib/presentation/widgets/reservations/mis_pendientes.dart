import 'package:flutter/material.dart';
import 'package:frontend/entities/reservation.dart';
import 'package:frontend/presentation/widgets/reservations/detalle_reserva.dart';

class MisPendientes extends StatelessWidget {
  final Reservation reservation;
  const MisPendientes({super.key, required this.reservation});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final sizeScreen = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 15),
          Text(reservation.date),
          const SizedBox(height: 15),
          Container(
            width: sizeScreen.width,
            decoration: BoxDecoration(
                color: colors.background,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  width: 0.8,
                  color: colors.primary,
                )),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const CircleAvatar(
                        backgroundImage: NetworkImage(
                            'https://predis.ai/top-instagram-accounts/leomessi.jpeg'),
                      ),
                      const SizedBox(width: 15),
                      Column(
                        children: [
                          Text(
                              '${reservation.place} (${reservation.building})'),
                          Text(reservation.startHour),
                        ],
                      ),
                    ],
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) =>
                              DetalleReserva(reservation: reservation)));
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (context) => const DetalleReserva()));
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: colors.primary,
                      elevation: 0,
                    ),
                    child: const Text(
                      'Reservado',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
