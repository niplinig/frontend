import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';
import 'dart:convert';
import 'models/data.dart';

Future<List<Reservation>> fetchReservations(http.Client client) async {
  final response = await client.get(Uri.parse(
      'https://backend-server.deno.dev/reservations_by_user/202008397'));
  return compute(parseReservations, response.body);
}

List<Reservation> parseReservations(String responseBody) {
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();
  return parsed.map<Reservation>((json) => Reservation.fromJson(json)).toList();
}

class MoreInfo extends StatefulWidget {
  final Schedule schedule;

  const MoreInfo({
    super.key,
    required this.schedule,
  });

  @override
  State<MoreInfo> createState() => _MoreInfoState();
}

class _MoreInfoState extends State<MoreInfo> {
  bool _isReserved = false;

  void _reserve() async {
    setState(() {
      _isReserved = true;
    });
    final response = await http.post(
      Uri.parse('https://backend-server.deno.dev/reservations'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8'
      },
      body: jsonEncode(
          <String, dynamic>{'id': '1', 'user': '202008397', 'schedule': '1'}),
    );
    if (response.statusCode == 200) {
      Fluttertoast.showToast(msg: "Reserva exitosa");
    } else {
      Fluttertoast.showToast(msg: "Reserva fallida");
      throw Exception('Failed to create a reservation');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.schedule.place),
        centerTitle: true,
      ),
      body: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Image.network(widget.schedule.pictureURL),
            ),
            Padding(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: Row(
                  children: <Widget>[
                    Text(
                      'Descripción',
                      style: Theme.of(context).textTheme.headlineSmall,
                      textAlign: TextAlign.left,
                    ),
                  ],
                )),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                widget.schedule.description,
                style: Theme.of(context).textTheme.bodyMedium,
                textAlign: TextAlign.left,
              ),
            ),
            Padding(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: Row(
                  children: <Widget>[
                    Text(
                      'Fecha',
                      style: Theme.of(context).textTheme.headlineSmall,
                      textAlign: TextAlign.left,
                    ),
                  ],
                )),
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: <Widget>[
                    Text(
                      widget.schedule.date,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                )),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: <Widget>[
                  Text(
                    '${widget.schedule.startHour} - ${widget.schedule.endHour}',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
            ),
            FutureBuilder<List<Reservation>>(
                future: fetchReservations(http.Client()),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    snapshot.data!.forEach((element) {
                      if (element.schedule == widget.schedule.id) {
                        _isReserved = true;
                      }
                    });
                    return ElevatedButton(
                        onPressed: _isReserved == false ? () => _reserve() : null,
                        child: Text("Reservar"));
                  } else if (snapshot.hasError) {
                    return ElevatedButton(
                        onPressed: null, child: Text("${snapshot.error}"));
                  }
                  return const CircularProgressIndicator();
                })
          ])),
    );
  }
}
