import 'package:dio/dio.dart';
import 'package:hm_shop/constants/index.dart';

class DioRequest {
  final _dio = Dio();
  DioRequest() {
    _dio.options
      ..baseUrl = GlobalConstants.Base_Url
      ..connectTimeout = Duration(seconds: GlobalConstants.Timeout)
      ..receiveTimeout = Duration(seconds: GlobalConstants.Timeout)
      ..sendTimeout = Duration(seconds: GlobalConstants.Timeout);
      _addInterceptors();
  }
  void _addInterceptors(){
    _dio.interceptors.add(InterceptorsWrapper(
      onRequest: (request, handler) {
        return handler.next(request);
      },
      onResponse: (response, handler) {
        if(response.statusCode! >= 200 && response.statusCode! < 300){
          handler.next(response);
          return ;
        }
        handler.reject(DioException(requestOptions: response.requestOptions));
      },
      onError: (error, handler) {
        handler.reject(error);
      },
    ));
  }

  get(String url, {Map<String, dynamic>? queryParameters}){
    return _handleResponse(_dio.get(url, queryParameters: queryParameters));
  }
  Future<dynamic> _handleResponse(Future<Response<dynamic>> task) async{
    try{
    Response<dynamic> res =await task;
    final data = res.data as Map<String, dynamic>;
    if(data['code'] == GlobalConstants.Success_Code){
      return data['result'];
    }
    throw Exception(data['msg'] ?? '加载数据异常');
    }catch(e){
      throw Exception(e);
    } 
    
  }
}

final dioRequest = DioRequest();
