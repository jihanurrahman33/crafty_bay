import 'package:carousel_slider/carousel_slider.dart';
import 'package:crafty_bay/app/app_colors.dart';
import 'package:crafty_bay/app/assets_paths.dart';
import 'package:crafty_bay/features/common/ui/controllers/main_bottom_nav_controller.dart';
import 'package:crafty_bay/features/product/ui/screens/product_category_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../widgets/app_bar_icon_button.dart';
import '../widgets/home_carousel_slider.dart';
import '../../../common/ui/widgets/product_category_item.dart';
import '../widgets/product_search_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});


  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              SizedBox(height: 16),
              ProductSearchBar(),
              SizedBox(height: 16),
              HomeCarouselSlider(),
              SizedBox(height: 16),
              _buildSectionHeader(
                title: 'Categories',
                onTapSeeAll: () {
                  Get.find<MainBottomNavController>().moveToCategory();
                },
              ),
              _getCategoryList(),
              _buildSectionHeader(title: 'Popular', onTapSeeAll: () {}),
              _buildSectionHeader(title: 'Special', onTapSeeAll: () {}),
              _buildSectionHeader(title: 'New', onTapSeeAll: () {}),
            ],
          ),
        ),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: SvgPicture.asset(AssetPath.navAppLogoSvg),
      actions: [
        AppBarIconButton(iconData: Icons.person, onTap: () {}),
        AppBarIconButton(iconData: Icons.call, onTap: () {}),
        AppBarIconButton(
          iconData: Icons.notifications_on_outlined,
          onTap: () {},
        ),
      ],
    );
  }

  Widget _buildSectionHeader({
    required String title,
    required VoidCallback onTapSeeAll,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: Theme.of(context).textTheme.titleSmall),
        TextButton(onPressed: onTapSeeAll, child: Text('See all')),
      ],
    );
  }

  Widget _getCategoryList() {
    return SizedBox(
      height: 100,
      child: ListView.separated(
        separatorBuilder: (context, index) {
          return SizedBox(width: 8);
        },
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (context, index) {
          return ProductCategoryItem();
        },
      ),
    );
  }
}
