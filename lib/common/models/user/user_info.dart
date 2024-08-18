import 'package:json_annotation/json_annotation.dart';

part 'user_info.g.dart';

@JsonSerializable()
class UserInfo {
  UserInfo({
    required this.admin,
    required this.chapterTops,
    required this.coinCount,
    required this.collectIds,
    required this.email,
    required this.icon,
    required this.id,
    required this.nickname,
    required this.password,
    required this.publicName,
    required this.token,
    required this.type,
    required this.username,
  });

  final bool? admin;
  final List<dynamic>? chapterTops;
  final int? coinCount;
  final List<dynamic>? collectIds;
  final String? email;
  final String? icon;
  final int? id;
  final String? nickname;
  final String? password;
  final String? publicName;
  final String? token;
  final int? type;
  final String? username;

  factory UserInfo.fromJson(Map<String, dynamic> json) => _$UserInfoFromJson(json);

  Map<String, dynamic> toJson() => _$UserInfoToJson(this);

}

/*
{
	"admin": false,
	"chapterTops": [],
	"coinCount": 33,
	"collectIds": [],
	"email": "",
	"icon": "",
	"id": 163398,
	"nickname": "mietl",
	"password": "",
	"publicName": "mietl",
	"token": "",
	"type": 0,
	"username": "mietl"
}*/