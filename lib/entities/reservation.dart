class Reservation {
  final String? user;
  final String place;
  final String date;
  final String startHour;
  final String endHour;
  final String building;
  final String pictureUrl;
  final String description;

  Reservation({
    this.user,
    required this.place,
    required this.date,
    required this.startHour,
    required this.endHour,
    required this.building,
    required this.pictureUrl,
    required this.description,
  });
}
