class DiaryModel {
  final String title;
  final String subtitle;
  final String? userId;
  final String id;

  DiaryModel({
    required this.userId,
    required this.title,
    required this.subtitle,
    required this.id,
  });

  DiaryModel.create({
    this.id = '',
    required this.userId,
    required this.title,
    required this.subtitle,
  });
}