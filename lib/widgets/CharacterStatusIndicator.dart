import 'package:flutter/material.dart';

class CharacterStatusIndicator extends StatelessWidget {
  final String status;

  CharacterStatusIndicator({Key? key, required this.status}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Icon(
        Icons.circle,
        color: status == 'Alive' ? Colors.green : (status == 'Dead' ? Colors.red : Colors.grey),
        size: 10
    );
  }
}
