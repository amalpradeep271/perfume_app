import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:perfume_app/core/configs/assets/app_vectors.dart';
import 'package:perfume_app/core/configs/theme/app_colors.dart';
import 'package:perfume_app/core/configs/theme/app_text_theme.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.white,
      elevation: 0,
      automaticallyImplyLeading: false,
      toolbarHeight: 165,
      title: Padding(
        padding: const EdgeInsets.only(right: 8.0, left: 8, top: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RichText(
                  text: TextSpan(
                    text: 'Welcome, ',
                    style: AppTextStyles.base.s18.blackColor,
                    children: [
                      TextSpan(
                        text: 'James!',
                        style: AppTextStyles.base.s18.blackColor.w900,
                      ),
                    ],
                  ),
                ),
                SvgPicture.asset(AppVectors.bellIcon),
              ],
            ),
            const SizedBox(height: 18),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Search..',
                      hintStyle: AppTextStyles.base.greycolor.s14,
                      prefixIcon: const Icon(Icons.search, color: Colors.grey),
                      filled: true,
                      fillColor: AppColors.white,
                      contentPadding: const EdgeInsets.symmetric(
                        vertical: 12,
                        horizontal: 16,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(24),
                        borderSide: BorderSide(
                          color: AppColors.borderGrey,
                          width: 1,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(24),
                        borderSide: BorderSide(color: AppColors.grey, width: 1),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.red,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 14,
                    ),
                    textStyle: AppTextStyles.base.whiteColor.s14.w500,
                  ),
                  child: Row(
                    spacing: 5,
                    children: [
                      Text(
                        'Scan Here',
                        style: AppTextStyles.base.whiteColor.w500.s14,
                      ),

                      Icon(
                        Icons.qr_code_scanner,
                        color: AppColors.white,
                        size: 20,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      titleSpacing: 0,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(165);
}
