// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/widgets.dart';
import 'package:perfume_app/core/configs/assets/app_images.dart';

import 'package:perfume_app/domain/home/entities/home_entity.dart';
import 'package:perfume_app/presentation/home/widgets/custom_gridview_builder.dart';
import 'package:perfume_app/presentation/home/widgets/custom_heading.dart';
import 'package:perfume_app/presentation/home/widgets/product_card.dart';

class CustomProductCard extends StatelessWidget {
  final HomeEntity home;
  const CustomProductCard({super.key, required this.home});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 12),
        CustomHeading(title: home.data!.homeFields![4].name ?? ""),
        SizedBox(height: 12),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: CustomGridviewBuilder(
            itemBuilder: (_, index) {
              return ProductCard(
                imageUrl:
                    home.data!.homeFields![4].products![index].image ??
                    AppImages.noImageAvailable,
                title: home.data!.homeFields![4].products![index].name ?? "",
                price:
                    home.data!.homeFields![4].products![index].price.toString(),
                actualPrice:
                    home.data!.homeFields![4].products![index].actualPrice
                        .toString(),
                unit: "per Dozen",
                offer: home.data!.homeFields![4].products![index].offer!,
                isWishlisted: false,
                onAddToCart: () {},
                onRfq: () {},
                onToggleWishlist: () {},
              );
            },
            itemCount: 2,
          ),
        ),
        SizedBox(height: 12),
      ],
    );
  }
}
