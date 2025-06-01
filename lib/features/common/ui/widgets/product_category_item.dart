import 'package:flutter/material.dart';

import '../../../../app/app_colors.dart';

class ProductCategoryItem extends StatelessWidget {
  const ProductCategoryItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
              color: AppColors.themeColor.withOpacity(0.2),
              borderRadius: BorderRadius.circular(8)
          ),
          padding: EdgeInsets.all(16),
          child: Icon(Icons.computer,color: AppColors.themeColor,size: 32,),
        ),
        SizedBox(height: 4,),
        Text('Computers',style: Theme.of(context).textTheme.bodyLarge?.copyWith(
            color: AppColors.themeColor
        ),)
      ],
    );
  }
}
