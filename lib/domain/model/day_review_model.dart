class DayReviewModel {
  final String text;
  final String? userId;
  final String id;

  DayReviewModel({
    required this.userId,
    required this.text,
    required this.id,
  });

  DayReviewModel.create({
    this.id = '',
    required this.userId,
    required this.text
  });
}