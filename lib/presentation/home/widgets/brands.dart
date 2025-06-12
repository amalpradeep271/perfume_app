// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:perfume_app/core/configs/theme/app_colors.dart';
import 'package:perfume_app/domain/home/entities/home_entity.dart';
import 'package:perfume_app/presentation/home/widgets/custom_heading.dart';

class Brands extends StatelessWidget {
  final List<BrandEntity>? brands;

  const Brands({super.key, this.brands});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Column(
        children: [
          CustomHeading(title: "Shop By Brands"),
          SizedBox(height: 12),
          SizedBox(
            height: 104,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemBuilder: (context, index) {
                return Container(
                  width: 130,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: AppColors.borderGrey, width: 1),
                  ),
                  child: Image.network(
                    brands![index].image.toString(),
                    errorBuilder: (context, error, stackTrace) {
                      return Image.asset(
                        'assets/images/notfoundimage.jpg',
                        height: 130,
                        fit: BoxFit.contain,
                      );
                    },
                  ),
                );
              },
              separatorBuilder: (context, index) => const SizedBox(width: 10),
              itemCount: brands?.length ?? 0,
            ),
          ),
        ],
      ),
    );
  }
}
