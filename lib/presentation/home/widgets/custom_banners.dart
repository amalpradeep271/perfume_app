import 'package:flutter/material.dart';
import 'package:perfume_app/core/configs/theme/app_colors.dart';
import 'package:perfume_app/domain/home/entities/home_entity.dart';
import 'package:perfume_app/presentation/home/widgets/custom_gridview_builder.dart';

class CustomBanners extends StatelessWidget {
  final HomeEntity home;

  const CustomBanners({super.key, required this.home});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: CustomGridviewBuilder(
        itemBuilder: (_, index) {
          return Container(
            width: 195,
            height: 291,
            padding: const EdgeInsets.only(top: 15),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                  home.data!.homeFields![6].banners![index].image ?? '',
                ),
                fit: BoxFit.fill,
              ),
              borderRadius: BorderRadius.circular(16),
              color: AppColors.white,
              boxShadow: const [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 4,
                  offset: Offset(0, 2),
                ),
              ],
            ),
          );
        },
        itemCount: 2,
      ),
    );
  }
}
