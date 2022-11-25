import 'package:flutter/material.dart';
import 'diary_screen_arguments.dart';

class Calendar extends StatelessWidget {
  final double width;
  final String path;

  Calendar({required this.width, super.key, required this.path});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20),
      width: width,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.elliptical(12, 12)),
      ),
      child: CalendarDatePicker(
        initialDate: DateTime.now(),
        firstDate: DateTime(2010, 8),
        lastDate: DateTime.now().add(Duration(days: 100000)),
        onDateChanged: (DateTime value) {
          Navigator.pushNamed(
            context,
            path,
            arguments:
            DiaryScreenArguments(
              date: value,
            ),
          );
        },
      ),
    );
  }
}
