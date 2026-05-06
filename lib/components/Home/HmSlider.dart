import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:hm_shop/viewmodels/Home.dart';

class Hmslider extends StatefulWidget {
  final List<BannerItem> bannerList;
  const Hmslider({super.key, required this.bannerList});

  @override
  State<Hmslider> createState() => _HmsliderState();
}

class _HmsliderState extends State<Hmslider> {
  Widget _getSlider() {
    final double width = MediaQuery.of(context).size.width;
    return CarouselSlider(
      items: List.generate(widget.bannerList.length, (int index) {
        return Image.network(
          widget.bannerList[index].imgUrl,
          fit: BoxFit.cover,
          width: width,
        );
      }),
      options: CarouselOptions(
        viewportFraction: 1.0,
        autoPlay: true,
        autoPlayInterval: Duration(seconds: 5),
        height: 200,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [_getSlider()]);
  }
}
