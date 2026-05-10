import 'package:hm_shop/constants/index.dart';
import 'package:hm_shop/utils/diorequest.dart';
import 'package:hm_shop/viewmodels/user.dart';

Future<UserInfo> loginApi(Map<String,dynamic> data) async{
  return UserInfo.fromJSON(await DioRequest().post(HttpConstants.LOGIN, data: data));
  }
Future<UserInfo> getUserInfoApi() async{
  return UserInfo.fromJSON(await DioRequest().get(HttpConstants.USER_PROFILE));
  }