import 'package:flutter/material.dart';

class MyChechBox extends StatelessWidget {
  final bool value;

  const MyChechBox({super.key, required this.value});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Container(
      width: 15,
      height: 15,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(7.5),
        color: value ? Colors.blue : null,
        border: !value ? Border.all(color: Colors.blue) : null,
      ),
      child: value
          ? const Icon(
        Icons.check,
        size: 12,
        color: Colors.white,
      )
          : null,
    );
  }
}