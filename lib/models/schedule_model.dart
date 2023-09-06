import 'package:frontend/entities/reservation.dart';

class ScheduleModel {
  final String id;
  final String place;
  final String building;
  final String date;
  final String capacity;
  final String startHour;
  final String endHour;
  final String description;
  final String pictureUrl;

  ScheduleModel({
    required this.id,
    required this.place,
    required this.building,
    required this.date,
    required this.capacity,
    required this.startHour,
    required this.endHour,
    required this.description,
    required this.pictureUrl,
  });

  factory ScheduleModel.fromJsonMap(Map<String, dynamic> json) => ScheduleModel(
        id: json["id"],
        place: json["place"],
        building: json["building"],
        date: json["date"],
        capacity: json["capacity"],
        startHour: json["start_hour"],
        endHour: json["end_hour"],
        description: json["description"],
        pictureUrl: json["picture_url"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "place": place,
        "building": building,
        "date": date,
        "capacity": capacity,
        "start_hour": startHour,
        "end_hour": endHour,
        "description": description,
        "picture_url": pictureUrl,
      };
  Reservation toMessageEntity() => Reservation(
      place: place,
      date: date,
      startHour: startHour,
      endHour: endHour,
      building: building,
      pictureUrl: pictureUrl,
      description: description);
}
