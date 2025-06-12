import 'package:flutter/widgets.dart';
import 'package:perfume_app/core/configs/theme/app_text_theme.dart';

class CustomHeading extends StatelessWidget {
  final String title;
  const CustomHeading({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: AppTextStyles.base.s18.w900),
          Text("View All", style: AppTextStyles.base.s12.w600.underline),
        ],
      ),
    );
  }
}
