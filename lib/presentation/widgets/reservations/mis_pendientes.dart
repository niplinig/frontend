import 'package:flutter/material.dart';
// import 'package:frontend/presentation/widgets/reservations/detalle_reserva.dart';

class MisPendientes extends StatelessWidget {
  const MisPendientes({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final sizeScreen = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Esta Semana',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(height: 15),
          const Text('Martes 15 de agosto'),
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
                  const Row(
                    children: [
                      CircleAvatar(
                        backgroundImage: NetworkImage(
                            'https://predis.ai/top-instagram-accounts/leomessi.jpeg'),
                      ),
                      SizedBox(width: 15),
                      Column(
                        children: [
                          Text('Yoga (Peñas)'),
                          Text('8:00 AM'),
                        ],
                      ),
                    ],
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed("/detailreservation");
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
