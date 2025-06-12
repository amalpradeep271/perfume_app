import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final Widget? content;
  const CustomCard({super.key, this.content});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        height: 150,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.blueAccent,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Align(
            alignment: Alignment.centerLeft,
            child: content ?? SizedBox(),
          ),
        ),
      ),
    );
  }
}
