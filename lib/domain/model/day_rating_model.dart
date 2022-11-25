class DayRatingModel {
  final String date;
  final double rate;
  final String? userId;
  final String id;

  DayRatingModel({
    required this.date,
    required this.userId,
    required this.rate,
    required this.id,
  });

  DayRatingModel.create(
      {this.id = '',
      required this.date,
      required this.userId,
      required this.rate});
}
