import 'dart:convert';

List<Schedule> modelScheduleFromJson(String str) =>
    List<Schedule>.from(json.decode(str).map((x) => Schedule.fromJson(x)));

class User {
  final String id;
  final String name;
  final String email;

  User({required this.id, required this.name, required this.email});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        id: json['id'] as String,
        name: json['name'] as String,
        email: json['email'] as String);
  }
}

class Schedule {
  final String id;
  final String place;
  final String building;
  final String date; // day-month-year
  final String capacity;
  final String startHour; // hour:minutes
  final String endHour; // hour:minutes
  final String description;
  final String pictureURL;

  Schedule(
      {required this.id,
      required this.place,
      required this.building,
      required this.date,
      required this.capacity,
      required this.startHour,
      required this.endHour,
      required this.description,
      required this.pictureURL});

  factory Schedule.fromJson(Map<String, dynamic> json) {
    return Schedule(
      id: json['id'] as String,
      place: json['place'] as String,
      building: json['building'] as String,
      date: json['date'] as String,
      capacity: json['capacity'] as String,
      startHour: json['start_hour'] as String,
      endHour: json['end_hour'] as String,
      description: json['description'] as String,
      pictureURL: json['picture_url'] as String,
    );
  }
}

class Reservation {
  final String id;
  final String user;
  final String schedule;

  Reservation({required this.id, required this.user, required this.schedule});

  factory Reservation.fromJson(Map<String, dynamic> json) {
    return Reservation(
        id: json['id'] as String,
        user: json['user'] as String,
        schedule: json['schedule'] as String);
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'user': user,
        'schedule': schedule,
      };
}
