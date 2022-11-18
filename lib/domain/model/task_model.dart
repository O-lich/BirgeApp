class TaskModel {
  final String text;
  final String? userId;
  final String id;
  final String date;

  TaskModel({
    required this.date,
    required this.userId,
    required this.text,
    required this.id,
  });

  TaskModel.create({
    this.id = '',
    required this.date,
    required this.userId,
    required this.text,
  });
}