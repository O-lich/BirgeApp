class DiaryModel {
  final String title;
  final String subtitle;
  final String? userId;
  final String id;
  final String date;

  DiaryModel({
    required this.date,
    required this.userId,
    required this.title,
    required this.subtitle,
    required this.id,
  });

  DiaryModel.create({
    this.id = '',
    required this.date,
    required this.userId,
    required this.title,
    required this.subtitle,
  });
}