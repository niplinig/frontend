import 'package:flutter/material.dart';
import 'package:frontend/entities/reservation.dart';
import 'package:frontend/helpers/get_reservation_answer.dart';

class ReservationProvider extends ChangeNotifier {
  final GetReservationAnswer getRerservationAnswer = GetReservationAnswer();
  List<Reservation> reservationList = [];

  Future<void> reservationRequest() async {
    final List<Reservation> reservations =
        await getRerservationAnswer.getAllSchedules();
    for (var r in reservations) {
      reservationList.add(r);
    }
    notifyListeners();
  }
}
