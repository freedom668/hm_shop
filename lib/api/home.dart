import 'package:hm_shop/constants/index.dart';
import 'package:hm_shop/utils/diorequest.dart';
import 'package:hm_shop/viewmodels/home.dart';

Future<List<BannerItem>> getBannerListApi() async {
  return ((await dioRequest.get(HttpConstants.Banner_List)) as List).map((item) {
    return BannerItem.fromJson(item as Map<String, dynamic>);
  }).toList();
}

/// 分类列表
Future<List<CategoryItem>> getCategoryListApi() async {
  return ((await dioRequest.get(HttpConstants.Category_List)) as List).map((item) {
    return CategoryItem.fromJson(item as Map<String, dynamic>);
  }).toList();
}

//特惠推荐
Future<SpecialRecommendResult> getProductListApi() async {
  return SpecialRecommendResult.fromJson(
    await dioRequest.get(HttpConstants.Product_List));
}

// 热榜推荐
Future<SpecialRecommendResult> getInVogueListAPI() async {
  // 返回请求
  return SpecialRecommendResult.fromJson(
    await dioRequest.get(HttpConstants.IN_VOGUE_LIST),
  );
}
 
// 一站式推荐
Future<SpecialRecommendResult> getOneStopListAPI() async {
  // 返回请求
  return SpecialRecommendResult.fromJson(
    await dioRequest.get(HttpConstants.ONE_STOP_LIST),
  );
}