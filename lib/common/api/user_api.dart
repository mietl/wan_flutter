import 'package:wan_flutter/common/models/coin.dart';
import 'package:wan_flutter/common/models/wan_response.dart';
import 'package:wan_flutter/common/utils/api_constant.dart';
import 'package:wan_flutter/common/utils/http_util.dart';

class UserApi{
  static Future<Coin> getUserCoin() async {
    var response = await WanHttpUtil().get(ApiConstant.coin);

    var wanResponse = ObjectResponse<Coin>.fromJson(response.data,(json) => Coin.fromJson(json));

    // 先暂时这样吧
    return wanResponse.data!;
  }
}

