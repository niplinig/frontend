import 'package:flutter/material.dart';

class DetalleReserva extends StatelessWidget {
  const DetalleReserva({super.key});

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
            child: _DetailReservation(),
          ),
        ],
      ),
    );
  }
}

class _DetailReservation extends StatelessWidget {
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
              PopupMenuButton(
                onSelected: (value) {
                  // your logic
                },
                itemBuilder: (BuildContext bc) {
                  return const [
                    PopupMenuItem(
                      // value: '/hello',
                      child: Text("btn 1"),
                    ),
                    PopupMenuItem(
                      // value: '/about',
                      child: Text("btn 2"),
                    ),
                    PopupMenuItem(
                      // value: '/contact',
                      child: Text("btn 3"),
                    )
                  ];
                },
              )
            ],
          ),
        ),
        const SizedBox(height: 15),
        _ImageBubble(),
        const SizedBox(height: 15),
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum cursus imperdiet arcu sed blandit. Vestibulum auctor augue ac est pharetra, eu tincidunt risus rutrum. Donec nec neque non arcu tristique dapibus. Duis at purus est. Donec posuere accumsan enim, ac euismod est. Quisque accumsan venenatis venenatis. Mauris vitae commodo est, sed auctor metus. Quisque posuere enim erat, sed volutpat justo feugiat non. Quisque erat ante, scelerisque vel eleifend non, lacinia at mauris. Aliquam vestibulum sapien est, quis mattis neque ultricies sit amet. Aenean maximus bibendum laoreet. Nulla facilisi. Curabitur massa erat, dapibus nec rutrum sit amet, sodales quis odio. Integer id blandit sem. Donec volutpat orci risus.',
            style: TextStyle(fontSize: 15),
            textAlign: TextAlign.justify,
          ),
        )
      ],
    );
  }
}

class _ImageBubble extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size; //Dimensiones dek dispositivo
    return Image.network(
      'https://upload.wikimedia.org/wikipedia/commons/thumb/3/3f/Placeholder_view_vector.svg/681px-Placeholder_view_vector.svg.png',
      width: size.width * 0.7,
      height: 150,
      fit: BoxFit.cover,
      loadingBuilder: (context, child, loadingProgress) {
        if (loadingProgress == null) return child;

        return Container(
          width: size.width * 0.7,
          height: 150,
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: const Text('Messi te esta enviando un mensaje'),
        );
      },
    );
  }
}
