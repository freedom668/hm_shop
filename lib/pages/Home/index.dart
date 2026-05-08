import 'package:flutter/material.dart';
import 'package:hm_shop/api/home.dart';
import 'package:hm_shop/components/Home/HmCategory.dart';
import 'package:hm_shop/components/Home/HmHot.dart';
import 'package:hm_shop/components/Home/HmMoreList.dart';
import 'package:hm_shop/components/Home/HmSlider.dart';
import 'package:hm_shop/components/Home/HmSuggestion.dart';
import 'package:hm_shop/viewmodels/Home.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List<CategoryItem> _categoryList = [];  

  List<BannerItem> _bannerList = [
    //BannerItem(
      //id: '1',
      //imgUrl: 'https://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/meituan/1.jpg',
    //),
    //BannerItem(
      //id: '2',
      //imgUrl: 'https://img95.699pic.com/photo/60023/9375.jpg_wh860.jpg',
    //),
      //imgUrl: 'https://img95.699pic.com/photo/60023/9375.jpg_wh860.jpg',
    //),
    //BannerItem(
      //id: '3',
      //imgUrl: 'https://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/meituan/3.jpg',
    //),
  ];

  SpecialRecommendResult _specialRecommendResult = SpecialRecommendResult(
    id: '',
    title: '',
    subTypes: [],
  );

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getBannerList();
    _getCategoryList();
    _getProductList();
  }

  /// 获取特惠推荐
  void _getProductList() async{
    _specialRecommendResult = await getProductListApi();
    setState(() {});
  }

  List<Widget> _getScrollChildren() {
    return [
      SliverToBoxAdapter(child: Hmslider(bannerList: _bannerList)),
      SliverToBoxAdapter(child: SizedBox(height: 10)),
      SliverToBoxAdapter(child: HmCategory(categoryList: _categoryList)),
      SliverToBoxAdapter(child: SizedBox(height: 10)),
      SliverToBoxAdapter(child: Hmsuggestion(specialRecommendResult: _specialRecommendResult)),
      SliverToBoxAdapter(child: SizedBox(height: 10)),
      SliverToBoxAdapter(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Flex(
            direction: Axis.horizontal,
            children: [
              Expanded(child: HmHot()),
              SizedBox(width: 10),
              Expanded(child: HmHot()),
            ],
          ),
        ),
      ),
      HmMoreList(),
    ];
  }


  /// 获取banner列表
  void _getBannerList() async{
    _bannerList.addAll(await getBannerListApi());
    setState(() {});
  }

  /// 获取分类列表
  void _getCategoryList() async{
    _categoryList.addAll(await getCategoryListApi());
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(slivers: _getScrollChildren());
  }
}
