import 'package:hm_shop/constants/index.dart';
import 'package:hm_shop/utils/diorequest.dart';
import 'package:hm_shop/viewmodels/Home.dart';

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