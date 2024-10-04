import 'package:dio/dio.dart';
import 'package:wan_flutter/common/models/user/coin.dart';
import 'package:wan_flutter/common/models/app/wan_response.dart';
import 'package:wan_flutter/common/utils/api_constant.dart';
import 'package:wan_flutter/common/utils/http_util.dart';

class UserApi {
  static Future<Coin> getUserCoin() async {
    var response = await WanHttpUtil().get(ApiConstant.coin);

    var wanResponse = ObjectResponse<Coin>.fromJson(
        response.data, (json) => Coin.fromJson(json));

    return wanResponse.data;
  }

  static Future<Response> passwordLogin(
      String username, String password) async {
    return WanHttpUtil().post(ApiConstant.login,
        queryParameters: {'username': username, 'password': password});
  }

  // 注册
  static Future<Response> registerUser(
      String username, String password, String repassword) async {
    return WanHttpUtil().post(ApiConstant.register, queryParameters: {
      'username': username,
      'password': password,
      'repassword': repassword
    });
  }

  // 退出登录
  static Future<Response> logout() {
    return WanHttpUtil().post(
      ApiConstant.logout,
    );
  }
}
