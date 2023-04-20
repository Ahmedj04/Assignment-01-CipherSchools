import 'package:flutter/material.dart';

class CustomMetric extends StatelessWidget {
  const CustomMetric({
    super.key,
    required this.title,
    required this.content,
  });

  final String title, content;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style: TextStyle(
              color: Color(0xFFF37D1F),
              fontSize: 45,
              fontWeight: FontWeight.bold
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Text(
          content,
          style: TextStyle(
            fontSize: 20,
          ),
        ),
      ],
    );
  }
}