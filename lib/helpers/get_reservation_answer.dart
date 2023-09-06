import 'package:dio/dio.dart';
import 'package:frontend/entities/reservation.dart';
import 'package:frontend/models/schedule_model.dart';

class GetReservationAnswer {
  final _dio = Dio();
  Future<Reservation> getAnswer() async {
    final response =
        await _dio.get('https://backend-server.deno.dev/schedules/1');
    final scheduleModel = ScheduleModel.fromJsonMap(response.data);

    return scheduleModel.toMessageEntity();
  }

  Future<List<Reservation>> getAllSchedules() async {
    final response =
        await _dio.get('https://backend-server.deno.dev/schedules');
    final List<dynamic> data = response.data;
    final List<Reservation> reservations = data
        .map((item) => ScheduleModel.fromJsonMap(item).toMessageEntity())
        .toList();
    return reservations;
  }
}
