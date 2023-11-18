import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EmpteState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(top: 190),
        child: Column(
          children: [
            Image.asset(
              'assets/img/uiii.jpg',
              width: 120,
              height: 120,
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              'Your task is empty',
              style: TextStyle(
                  color: Colors.grey,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            )
          ],
        ),

      ),
    );
  }
}