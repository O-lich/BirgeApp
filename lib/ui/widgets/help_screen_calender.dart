import 'package:flutter/material.dart';

import '../../const/strings.dart';
import 'diary_screen_arguments.dart';

class HelpScreenCalendar extends StatelessWidget {
  final double width;

  HelpScreenCalendar({required this.width, super.key});

  String date = '';

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
          date = value.toString().substring(0, 10);
        },
      ),
    );
  }

  String returnDate() {
    return date;
  }
}
