import 'package:hm_shop/constants/index.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TokenManager{
  Future<SharedPreferences> _getInstance(){
    return SharedPreferences.getInstance();
  }

  String _token ='';
  /// 初始化token管理器
  Future<void> init() async{ 
    final prefs = await _getInstance();
    _token = prefs.getString(GlobalConstants.Token_Key) ?? '';
  }
  Future<void> setToken(String val) async{
    final prefs = await _getInstance();
    prefs.setString(GlobalConstants.Token_Key, val);
    _token = val;
  }
  String getToken(){
    return _token;
  }
  Future<void> removeToken() async{
    final prefs = await _getInstance();
    prefs.remove(GlobalConstants.Token_Key);
    _token = '';
  }
}

final tokenManager = TokenManager();