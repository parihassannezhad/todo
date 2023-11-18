import 'package:flutter/material.dart';
import 'package:todo/homePage.dart';

class MembersItem extends StatelessWidget {
  final MembersName name;
  final String title;
  final String imagePath;
  final bool selected;
  final Function() onTapContainer;

  const MembersItem({
    super.key,
    required this.imagePath,
    required this.selected,
    required this.title,
    required this.name,
    required this.onTapContainer,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(

          customBorder: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
          onTap: onTapContainer,
          child: Container(
            width: 64,
            height: 64,
            margin: const EdgeInsets.only(right: 11, left: 11),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(33),
              gradient: selected
                  ? const LinearGradient(begin: Alignment.topLeft, colors: [
                      Color(0xff376AED),
                      Color(0xff49B0E2),
                      Color(0xff9CECFB),
                    ])
                  : LinearGradient(begin: Alignment.topLeft, colors: [
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
