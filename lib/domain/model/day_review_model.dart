class DayReviewModel {
  final DateTime date;
  final String text;
  final String? userId;
  final String id;

  DayReviewModel({
    required this.date,
    required this.userId,
    required this.text,
    required this.id,
  });

  DayReviewModel.create(
      {this.id = '',
      required this.date,
      required this.userId,
      required this.text});
}