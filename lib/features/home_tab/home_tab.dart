import 'package:flutter/material.dart';

class HomeTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 10,
      children: [
        Container(
          height: 100,
          width: double.infinity,
          color: Colors.red,
        ),
        Container(
          height: 100,
          width: double.infinity,
          color: Colors.blue,
        ),
        Container(
          height: 100,
          width: double.infinity,
          color: Colors.pink,
        ),
      ],
    );
  }
}
