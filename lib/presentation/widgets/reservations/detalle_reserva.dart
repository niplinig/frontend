import 'package:flutter/material.dart';
import 'package:frontend/entities/reservation.dart';

class DetalleReserva extends StatelessWidget {
  final Reservation reservation;
  const DetalleReserva({super.key, required this.reservation});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final sizeScreen = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mi reserva'),
        centerTitle: false,
      ),
      body: Column(
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
            child: _DetailReservation(
              reservation: reservation,
            ),
          ),
        ],
      ),
    );
  }
}

class _DetailReservation extends StatelessWidget {
  final Reservation reservation;

  const _DetailReservation({required this.reservation});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('${reservation.place} (${reservation.building})'),
                      Text('${reservation.startHour} - ${reservation.endHour}'),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: 15),
        _ImageBubble(urlImage: reservation.pictureUrl),
        const SizedBox(height: 15),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            reservation.description,
            style: const TextStyle(fontSize: 15),
            textAlign: TextAlign.justify,
          ),
        )
      ],
    );
  }
}

class _ImageBubble extends StatelessWidget {
  final String urlImage;

  const _ImageBubble({required this.urlImage});
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size; //Dimensiones dek dispositivo
    return Image.network(
      urlImage,
      width: size.width * 0.9,
      height: 250,
      fit: BoxFit.cover,
      loadingBuilder: (context, child, loadingProgress) {
        if (loadingProgress == null) return child;

        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: const Text('Messi te esta enviando un mensaje'),
        );
      },
    );
  }
}
