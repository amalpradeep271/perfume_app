import 'package:flutter/material.dart';
import 'package:perfume_app/core/configs/theme/app_colors.dart';
import 'package:perfume_app/core/configs/theme/app_text_theme.dart';

class ProductCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String price;
  final String actualPrice;
  final String unit;
  final String offer;
  final bool isWishlisted;
  final VoidCallback onAddToCart;
  final VoidCallback onRfq;
  final VoidCallback onToggleWishlist;

  const ProductCard({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.price,
    required this.actualPrice,
    required this.unit,
    required this.offer,
    required this.isWishlisted,
    required this.onAddToCart,
    required this.onRfq,
    required this.onToggleWishlist,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 195,
      height: 291,
      padding: const EdgeInsets.only(top: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: AppColors.white,
        boxShadow: const [
          BoxShadow(color: Colors.black12, blurRadius: 4, offset: Offset(0, 2)),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              if (offer.isNotEmpty)
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 18,
                    vertical: 2,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.borderGrey,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(8),
                      bottomRight: Radius.circular(8),
                    ),
                  ),
                  child: Text(offer, style: AppTextStyles.base.s12.greenColor),
                ),
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: GestureDetector(
                  onTap: onToggleWishlist,
                  child: Icon(
                    isWishlisted ? Icons.favorite : Icons.favorite_border,
                    color: isWishlisted ? Colors.red : Colors.black54,
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 8),

          Center(
            child: Image.network(
              imageUrl,
              height: 130,
              fit: BoxFit.contain,
              errorBuilder: (context, error, stackTrace) {
                return Image.asset(
                  'assets/images/notfoundimage.jpg',
                  height: 130,
                  fit: BoxFit.contain,
                );
              },
            ),
          ),

          const SizedBox(height: 8),

          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text(title, style: AppTextStyles.base.s12.blackColor.w600),
          ),

          const SizedBox(height: 4),

          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text(
              'AED $actualPrice',
              style: AppTextStyles.base.s12.greycolor.w600.lineThrough,
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'AED $price ',
                    style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                  TextSpan(
                    text: unit,
                    style: AppTextStyles.base.s10.blackColor.w600,
                  ),
                ],
              ),
            ),
          ),

          const Spacer(),

          // Bottom Buttons
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                OutlinedButton(
                  onPressed: onRfq,
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    side: BorderSide(color: AppColors.black),
                  ),
                  child: Text("RFQ", style: AppTextStyles.base.blackColor.s12),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: ElevatedButton(
                    onPressed: onAddToCart,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.red,
                      padding: const EdgeInsets.symmetric(vertical: 8),
                    ),
                    child: Text(
                      "Add to Cart",
                      style: AppTextStyles.base.whiteColor.s12,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
