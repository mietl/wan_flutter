import 'package:flutter/material.dart';
import 'package:wan_flutter/common/api/user_api.dart';
import 'package:wan_flutter/common/models/user/coin.dart';
import 'package:wan_flutter/common/provider/user_provider.dart';
import 'package:wan_flutter/pages/login/index.dart';
import 'package:provider/provider.dart';

class AvatarDrawer extends StatefulWidget{
  const AvatarDrawer({super.key});
  
  @override
  State<StatefulWidget> createState() {
    return _AvatarDrawerState();
  }

}

class _AvatarDrawerState extends State<AvatarDrawer>{
  Coin? _coin;

  late UserProvider _userProvider;


  @override
  void initState() {
    _userProvider = Provider.of<UserProvider>(context, listen: false);
    
    _userProvider.addListener(_userProviderListener);

    super.initState();
  }

  _userProviderListener(){
    if (_userProvider.userInfo != null) {
      _getUserCoin();
    }
  }
  

  _getUserCoin() async {
      final data = await UserApi.getUserCoin();
      setState(() {
        _coin = data;
      });
  }
  
  @override 
  void dispose() {
    _userProvider.removeListener(_userProviderListener);
    super.dispose();
  }
  @override
  Widget build(BuildContext context){
    return Drawer(
      child: ListView(
        children: <Widget>[
          DrawerHeader(
              decoration: const BoxDecoration(
                color:  Color(0xFFEADFD7),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(_coin?.username??'--',
                          style: const TextStyle(
                            fontSize: 24,
                          )
                      ),
                      const Icon(Icons.male,color: Color(0xFF619AC3),size: 29)
                    ],
                  ),
                  const Text(
                    '现实也许没有那么天真，但我想要做什么事，虽然不知道答案，但是只要有所行动，就一定会有所改变。',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style:TextStyle(fontSize: 14)
                  )
                ],
              )
          ),
          ListTile(
            leading: const Icon(Icons.credit_score),
            title: Text("当前积分(${_coin?.coinCount ?? 0} )"),
          ),
          const ListTile(
            leading: Icon(Icons.settings),
            title: Text('设置'),
          ),
          ListTile(
            leading: const Icon(Icons.logout),
            title: Text(_coin!=null?'退出登陆':'登录'),
            onTap: (){
              if(_coin==null){
                Navigator.of(context).push(MaterialPageRoute(builder:(context){
                  return const LoginPage();
                }));
              }
            },
          )
        ],
      ),
    );
  }
}