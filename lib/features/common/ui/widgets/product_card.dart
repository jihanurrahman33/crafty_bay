import 'package:flutter/material.dart';

import '../../../../app/app_colors.dart';
import '../../../../app/assets_paths.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      margin: EdgeInsets.all(2),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: AppColors.themeColor.withOpacity(0.2),
            offset: Offset(0.0, 0.7), //(x,y)
            blurRadius: 5.0,
          ),
        ],
      ),
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: AppColors.themeColor.withOpacity(0.1),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              ),
            ),
            width: 150,
            child: Image.asset(AssetPath.dummyNikeShoePng, height: 80),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Text(
                  'Nike ER34ST -New model of 2025',
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: TextStyle(
                    color: Colors.black54,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '৳100',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: AppColors.themeColor,
                      ),
                    ),
                    Wrap(
                      children: [
                        Icon(Icons.star, size: 18, color: Colors.amber),
                        Text('4.5', style: TextStyle(color: Colors.grey)),
                      ],
                    ),
                    Card(
                      color: AppColors.themeColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Icon(
                          Icons.favorite_outline_rounded,
                          size: 18,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
