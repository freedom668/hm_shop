import 'package:hm_shop/constants/index.dart';
import 'package:hm_shop/utils/diorequest.dart';
import 'package:hm_shop/viewmodels/home.dart';

Future<GoodsDetailsItems> getGuessListApi(Map<String, dynamic> params) async {
  return GoodsDetailsItems.fromJson(await dioRequest.get(HttpConstants.Guess_LIST, queryParameters: params));
  // return await dioRequest.get(HttpConstants.Guess_LIST);
}