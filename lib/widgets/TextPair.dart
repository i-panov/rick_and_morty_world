import 'package:flutter/material.dart';

class TextPair extends StatelessWidget {
  final String label, value;
  final Widget? beforeValue;

  TextPair({Key? key, required this.label, required this.value, this.beforeValue}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(label, style: TextStyle(color: Colors.grey, fontSize: 12)),
        Row(
          children: [
            if (beforeValue != null) beforeValue!,
            Text(value, style: TextStyle(color: Colors.white, fontSize: 16)),
          ],
        ),
      ],
    );
  }
}
