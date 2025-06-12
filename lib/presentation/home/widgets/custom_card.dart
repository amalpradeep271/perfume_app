import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final Widget? content;
  final String imageUrl;

  const CustomCard({super.key, this.content, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        height: 150,
        width: double.infinity,
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
        child: Stack(
          children: [
            Image.network(imageUrl, fit: BoxFit.cover),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Align(
                alignment: Alignment.centerLeft,
                child: content ?? SizedBox(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
