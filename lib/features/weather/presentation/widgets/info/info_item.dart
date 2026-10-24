import 'package:flutter/material.dart';

class InfoItem extends StatelessWidget {
  const InfoItem({
    super.key,
    required this.title,
    required this.value,
    required this.style,
  });

  final String title;
  final String value;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(title, style: style),
          const SizedBox(height: 10),
          Text(value, style: style),
        ],
      ),
    );
  }
}
