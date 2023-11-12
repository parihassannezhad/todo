import 'package:flutter/material.dart';

class MembersItem extends StatelessWidget {
  final String title;
  final String imagePath;
  final bool selected;

  const MembersItem({
    super.key,
    required this.imagePath,
    required this.selected,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        Container(
          width: 64,
          height: 64,
          margin: const EdgeInsets.only(right: 11, left: 11),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(33),
            gradient:selected?
            const LinearGradient(begin: Alignment.topLeft, colors: [
              Color(0xff376AED),
              Color(0xff49B0E2),
              Color(0xff9CECFB),
            ]) : LinearGradient(begin: Alignment.topLeft, colors: [
              Colors.grey,
              Colors.grey.shade400,
              Colors.grey.shade200,
            ]),

          ),
          child: Container(
            margin: const EdgeInsets.all(3),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30),
            ),
            padding: const EdgeInsets.all(5),
            child: Image.asset(
              imagePath,
            ),
          ),
        ),
        Padding(
            padding: const EdgeInsets.only(top: 4),
            child: Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
            ))
      ],
    );
  }
}

class SelectedItem extends StatelessWidget {
  const SelectedItem({
    super.key,
    required this.imagePath,
  });

  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 64,
      height: 64,
      margin: const EdgeInsets.only(right: 11, left: 11),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(33),
        gradient:
        const LinearGradient(begin: Alignment.topLeft, colors: [
          Color(0xff376AED),
          Color(0xff49B0E2),
          Color(0xff9CECFB),
        ]),
      ),
      child: Container(
        margin: const EdgeInsets.all(3),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
        ),
        padding: const EdgeInsets.all(5),
        child: Image.asset(
          imagePath,
        ),
      ),
    );
  }
}


