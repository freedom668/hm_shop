import 'package:flutter/material.dart';
import 'package:hm_shop/api/home.dart';
import 'package:hm_shop/components/Home/HmCategory.dart';
import 'package:hm_shop/components/Home/HmHot.dart';
import 'package:hm_shop/components/Home/HmMoreList.dart';
import 'package:hm_shop/components/Home/HmSlider.dart';
import 'package:hm_shop/components/Home/HmSuggestion.dart';
import 'package:hm_shop/utils/toastutils.dart';
import 'package:hm_shop/viewmodels/home.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List<CategoryItem> _categoryList = [];
  final ScrollController _scrollController = ScrollController();
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

  

  // 热榜推荐
  SpecialRecommendResult _inVogueResult = SpecialRecommendResult(
    id: "",
    title: "",
    subTypes: [],
  );
  // 一站式推荐
  SpecialRecommendResult _oneStopResult = SpecialRecommendResult(
    id: "",
    title: "",
    subTypes: [],
  );

  

  // 推荐列表
  List<GoodDetailItem> _recommendList = [];



  List<Widget> _getScrollChildren() {
    return [
      SliverToBoxAdapter(child: Hmslider(bannerList: _bannerList)),
      SliverToBoxAdapter(child: SizedBox(height: 10)),
      SliverToBoxAdapter(child: HmCategory(categoryList: _categoryList)),
      SliverToBoxAdapter(child: SizedBox(height: 10)),
      SliverToBoxAdapter(
        child: Hmsuggestion(specialRecommendResult: _specialRecommendResult),
      ),
      SliverToBoxAdapter(child: SizedBox(height: 10)),
      SliverToBoxAdapter(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Flex(
            direction: Axis.horizontal,
            children: [
              Expanded(
                child: HmHot(result: _inVogueResult, type: "hot"),
              ),
              SizedBox(width: 10),
              Expanded(
                child: HmHot(result: _oneStopResult, type: "step"),
              ),
            ],
          ),
        ),
      ),
      SliverToBoxAdapter(child: SizedBox(height: 10)),
      HmMoreList(recommendList: _recommendList), // 无限滚动列表
    ];
  }

@override
  void initState() {
    // TODO: implement initState
    super.initState();
    _registerEvent();
    Future.microtask(() {
      _paddingTop = 100;
      setState(() {});
      _Key.currentState?.show();
    });
   }

  void _registerEvent() {
    _scrollController.addListener(() {
      _scrollController.addListener(() {
        if (_scrollController.position.pixels >=
            (_scrollController.position.maxScrollExtent - 50)) {
          _getRecommendList();
        }
      });
    });
  }

  /// 获取特惠推荐
  Future<void> _getProductList() async {
    _specialRecommendResult = await getProductListApi();
  }

// 获取热榜推荐列表
  Future<void> _getInVogueList() async {
    _inVogueResult = await getInVogueListAPI();
  } 

  // 获取一站式推荐列表
  Future<void> _getOneStopList() async {
    _oneStopResult = await getOneStopListAPI();
  }

  /// 获取banner列表
  Future<void> _getBannerList() async {
    _bannerList.addAll(await getBannerListApi());
  }

  /// 获取分类列表
  Future<void> _getCategoryList() async {
    _categoryList.addAll(await getCategoryListApi());
  }
  // 获取推荐列表
  int _page = 1;
  bool _isLoading = false;
  bool _hasMore = true;
  Future<void> _getRecommendList() async {
    if (_isLoading || !_hasMore) {
      return;
    }
    _isLoading = true; // 加载中状态
    int requestPage = _page * 8;
    _recommendList = await getRecommendListAPI({"limit": requestPage});
    _isLoading = false; // 加载完成状态
    setState(() {});
    // 是否还有更多数据
    if (_recommendList.length < requestPage) {
      _hasMore = false;
      return;
    }
    _page++;
  }

  Future<void> _onRefresh() async {
    _page = 1;
    _isLoading = false;
    _hasMore = true;
    await _getBannerList();
    await _getCategoryList();
    await _getProductList();
    await _getInVogueList();
    await _getOneStopList();
    await _getRecommendList();
    ToastUtils.showToast(context, "刷新完成");
    _paddingTop =0;
    setState(() {});
  }
  final GlobalKey<RefreshIndicatorState> _Key = GlobalKey<RefreshIndicatorState>();
  double _paddingTop = 0;
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      key: _Key,
      onRefresh: _onRefresh,
      child: AnimatedContainer(
        padding: EdgeInsets.only(top: _paddingTop),
        duration: Duration(milliseconds: 300),
        child: CustomScrollView(
        controller: _scrollController,
        slivers: _getScrollChildren(),
      ),
      ),     
    );
  }
}
