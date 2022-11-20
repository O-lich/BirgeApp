import 'package:birge_app/ui/widgets/widgets.dart';
import 'package:flutter/material.dart';

class DiaryListTile extends StatelessWidget {
  final double width;
  final String title;
  final String subtitle;
  final Widget trailing;

  const DiaryListTile(
      {required this.width,
      super.key,
      required this.title,
      required this.subtitle,
      required this.trailing});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: width,
          child: ListTile(
            leading: const Icon(
              Icons.favorite,
              color: Color(0xff006FFD),
            ),
            title: Text(title),
            subtitle: Text(subtitle),
            trailing: trailing,
          ),
        ),
        spacerHeight(20),
      ],
    );
  }
}
