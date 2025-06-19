import 'package:crafty_bay/features/product/ui/screens/add_review_screen.dart';
import 'package:flutter/material.dart';

import '../../../../app/app_colors.dart';
import '../../../../app/constants.dart';

class ProductReviewsScreen extends StatelessWidget {
  const ProductReviewsScreen({super.key});

  static const String name = '/product-reviews-screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Reviews')),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.all(16),
              itemCount: 3,
              itemBuilder: (context, index) {
                return Card(
                  elevation: 0,
                  color: Colors.white,

                  child: Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 30,
                            height: 30,
                            decoration: BoxDecoration(
                              color: Colors.grey.shade300,
                            ),
                            child: Icon(
                              Icons.person_2_outlined,

                              color: Colors.grey,
                            ),
                          ),
                          SizedBox(width: 10),
                          Text(
                            'Md Jihanur Rahman',
                            style: Theme.of(
                              context,
                            ).textTheme.bodyLarge!.copyWith(
                              fontWeight: FontWeight.w600,
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 16),
                      Text(
                        '''Lorem ipsum dolor, sit amet consectetur adipisicing elit. Esse dignissimos quos repudiandae enim facilis iste, voluptatibus nulla laudantium cumque eveniet ad iure, ducimus sed nostrum, impedit optio reprehenderit! Commodi, architecto.''',
                        style: TextStyle(color: Colors.grey),
                      ),
                      SizedBox(height: 16),
                    ],
                  ),
                );
              },
            ),
          ),
          buildAddReviews(context),
        ],
      ),
    );
  }

  Container buildAddReviews(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.themeColor.withOpacity(0.15),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('Reviews (1000)', style: TextStyle(fontWeight: FontWeight.w600)),
          CircleAvatar(
            child: IconButton(
              onPressed: () {
                Navigator.pushNamed(context, AddReviewScreen.name);
              },
              icon: Icon(Icons.add),
            ),
          ),
        ],
      ),
    );
  }
}
