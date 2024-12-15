import 'package:flutter/material.dart';

class JokeTypeCard extends StatelessWidget {
  final String type;
  final VoidCallback onTap;

  const JokeTypeCard({required this.type, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        margin: EdgeInsets.all(10),
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Text(
            type.toUpperCase(),
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
