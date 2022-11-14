import 'package:birge_app/ui/widgets/widgets.dart';
import 'package:flutter/material.dart';

class DiaryListTile extends StatelessWidget {
  final void Function() onTap;
  final double width;
  final String title;
  final String subtitle;

  const DiaryListTile(
      {required this.onTap,
      required this.width,
      super.key,
      required this.title,
      required this.subtitle});

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
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: onTap,
          ),
        ),
        spacerHeight(20),
      ],
    );
  }
}
