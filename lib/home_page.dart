import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:frontend/models/data.dart';
import 'package:frontend/more_info.dart';
import 'package:frontend/presentation/widgets/shared/my_drawer.dart';
import 'package:http/http.dart' as http;

Future<List<Schedule>> fetchSchedules(http.Client client) async {
  final response =
      await client.get(Uri.parse('https://backend-server.deno.dev/schedules/'));
  return compute(parseSchedules, response.body);
}

List<Schedule> parseSchedules(String responseBody) {
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();
  return parsed.map<Schedule>((json) => Schedule.fromJson(json)).toList();
}

void main() => runApp(HomePage());

class HomePage extends StatelessWidget {
  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Horarios'),
          centerTitle: true,
        ),
        drawer: const MyDrawer(),
        body: Center(
            child: FutureBuilder<List<Schedule>>(
          future: fetchSchedules(http.Client()),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ScheduleList(schedules: snapshot.data!);
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }
            return const CircularProgressIndicator();
          },
        )));
  }
}

class ScheduleList extends StatelessWidget {
  const ScheduleList({super.key, required this.schedules});

  final List<Schedule> schedules;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding: const EdgeInsets.all(10),
        itemCount: schedules.length,
        itemBuilder: (_, index) {
          return Card(
            elevation: 2,
            shape: RoundedRectangleBorder(
                side: BorderSide(
                  color: Theme.of(context).colorScheme.outline,
                ),
                borderRadius: const BorderRadius.all(Radius.circular(12))),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(schedules[index].pictureURL),
                  ),
                  title: Text(schedules[index].place),
                  subtitle: Text(schedules[index].startHour +
                      ' - ' +
                      schedules[index].endHour),
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (_) => MoreInfo(schedule: schedules[index])));
                  },
                  trailing: Container(
                    child: Text(
                      "Disponible",
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.surface,
                        border: Border.all(
                            color: Theme.of(context).colorScheme.outline,
                            width: 1),
                        borderRadius: BorderRadius.circular(20)),
                  ),
                ),
              ],
            ),
          );
        });
  }
}
