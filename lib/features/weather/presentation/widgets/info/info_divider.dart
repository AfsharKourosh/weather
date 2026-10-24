import 'package:flutter/material.dart';

class InfoDivider extends StatelessWidget {
  const InfoDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 40,
      child: VerticalDivider(color: Colors.white, thickness: 2, width: 10),
    );
  }
}
