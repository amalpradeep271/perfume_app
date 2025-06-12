import 'package:flutter/material.dart';
import 'package:perfume_app/core/configs/theme/app_text_theme.dart';

class Categories extends StatelessWidget {
  const Categories({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Our Categories", style: AppTextStyles.base.s18.w900),
                Text("View All", style: AppTextStyles.base.s12.w600.underline),
              ],
            ),
          ),
          SizedBox(height: 12),
          SizedBox(
            height: 104,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemBuilder: (context, index) {
                return Container(
                  width: 72,
                  height: 72,
                  decoration: const BoxDecoration(
                    color: Colors.yellow,
                    shape: BoxShape.circle, // This makes it a circle
                  ),
                );
              },
              separatorBuilder: (context, index) => const SizedBox(width: 10),
              itemCount: 4,
            ),
          ),
        ],
      ),
    );
  }
}
