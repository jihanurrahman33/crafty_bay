import 'package:carousel_slider/carousel_slider.dart';
import 'package:crafty_bay/app/app_colors.dart';
import 'package:crafty_bay/features/home/data/models/slider_model.dart';
import 'package:flutter/material.dart';

class HomeCarouselSlider extends StatefulWidget {
  const HomeCarouselSlider({super.key, required this.sliders});
  final List<SliderModel> sliders;

  @override
  State<HomeCarouselSlider> createState() => _HomeCarouselSliderState();
}

class _HomeCarouselSliderState extends State<HomeCarouselSlider> {
  final ValueNotifier<int> _currentSlider = ValueNotifier(0);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            height: 180.0,
            viewportFraction: 1,
            onPageChanged: (int currentIndex, _) {
              _currentSlider.value = currentIndex;
            },
          ),
          items:
              widget.sliders.map((slider) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.symmetric(horizontal: 2.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: AppColors.themeColor,
                        image: DecorationImage(
                          image: NetworkImage(slider.photoUrl),
                          fit: BoxFit.cover,
                        ),
                      ),
                      alignment: Alignment.center,
                    );
                  },
                );
              }).toList(),
        ),
        SizedBox(height: 8),
        ValueListenableBuilder(
          valueListenable: _currentSlider,
          builder: (context, index, _) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for (int i = 0; i < widget.sliders.length; i++)
                  Container(
                    margin: EdgeInsets.only(left: 4),
                    width: 12,
                    height: 12,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade400, width: 1),
                      borderRadius: BorderRadius.circular(8),
                      color: index == i ? AppColors.themeColor : null,
                    ),
                  ),
              ],
            );
          },
        ),
      ],
    );
  }
}
