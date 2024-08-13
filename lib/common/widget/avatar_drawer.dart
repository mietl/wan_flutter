import 'package:flutter/material.dart';

class AvatarDrawer extends StatefulWidget{
  const AvatarDrawer({super.key});

  State<StatefulWidget> createState() {
    return _AvatarDrawerState();
  }

}

class _AvatarDrawerState extends State<AvatarDrawer>{
  @override
  Widget build(BuildContext context){
    return Drawer(
      child: ListView(
        children: const <Widget>[
          DrawerHeader(
              decoration: BoxDecoration(
                color: Color(0xEADFD7),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text('mietl',
                          style: TextStyle(
                            fontSize: 24,
                          )
                      ),
                      Icon(Icons.male,color: Color(0xFF619AC3),size: 29)
                    ],
                  ),
                  Text(
                    '现实也许没有那么天真，但我想要做什么事，虽然不知道答案，但是只要有所行动，就一定会有所改变。',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style:TextStyle(fontSize: 14)
                  )
                ],
              )
          ),
          ListTile(
            leading: Icon(Icons.credit_score),
            title: Text("当前积分"),
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('设置'),
          ),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text('退出登陆'),
          )
        ],
      ),
    );
  }
}