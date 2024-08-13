import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:wan_flutter/common/utils/api_constant.dart';
import './settings.dart';

class WanHttp {
  WanHttp();

  static const bool debugProxy = true;

  static final Dio _dio = Dio(BaseOptions(
    baseUrl: ApiConstant.baseUrl,
    connectTimeout: const Duration(seconds: 30),
    receiveTimeout: const Duration(seconds: 30)
  ));


  static void init(){
    if(isDebug){
      _dio.httpClientAdapter = IOHttpClientAdapter(
        createHttpClient: (){
          return HttpClient()
            ..findProxy = (uri){
              return 'PROXY 192.168.102.125:2214';
            };
            // ..badCertificateCallback((X509Certificate cret,String host,int port)=>true);
        }
      );
    }


    _dio.interceptors.add(InterceptorsWrapper(
      onRequest: (option,handler){
        return handler.next(option);
      },
      onResponse: (response,handler){
        return handler.next(response);
      },
      onError: (error,handler){
        return handler.next(error);
      }
    ));
  }




}