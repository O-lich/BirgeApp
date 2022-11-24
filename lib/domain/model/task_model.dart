class TaskModel {
  final String text;
  final String? userId;
  final String id;
  final String date;
  bool isChecked;

  TaskModel({
    required this.date,
    required this.userId,
    required this.text,
    required this.id,
    required this.isChecked,
  });

  TaskModel.create({
    this.id = '',
    this.isChecked = false,
    required this.date,
    required this.userId,
    required this.text,
  });
}