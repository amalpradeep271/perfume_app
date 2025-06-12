import 'package:flutter/material.dart';
import 'package:perfume_app/core/configs/assets/app_images.dart';
import 'package:perfume_app/core/configs/theme/app_text_theme.dart';
import 'package:perfume_app/domain/home/entities/home_entity.dart';
import 'package:perfume_app/presentation/home/widgets/custom_heading.dart';

class Categories extends StatelessWidget {
  final List<BrandEntity>? category;

  const Categories({super.key, this.category});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Column(
        children: [
          CustomHeading(title: "Our Categories"),

          SizedBox(height: 12),
          SizedBox(
            height: 104,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Container(
                      width: 72,
                      height: 72,
                      decoration: const BoxDecoration(
                        color: Colors.yellow,
                        shape: BoxShape.circle, // This makes it a circle
                      ),
                      child: Image.network(
                        category?[index].image ?? AppImages.noImageAvailable,
                      ),
                    ),
                    Text(
                      category?[index].name ?? '',
                      style: AppTextStyles.base.blackColor.s12.w600,
                    ),
                  ],
                );
              },
              separatorBuilder: (context, index) => const SizedBox(width: 10),
              itemCount: category?.length ?? 0,
            ),
          ),
        ],
      ),
    );
  }
}
