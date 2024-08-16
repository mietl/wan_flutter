import 'package:json_annotation/json_annotation.dart';
part 'coin.g.dart';

@JsonSerializable()
class Coin {
    Coin({
        required this.coinCount,
        required this.level,
        required this.nickname,
        required this.rank,
        required this.userId,
        required this.username,
    });

    final int? coinCount;
    final int? level;
    final String? nickname;
    final String? rank;
    final int? userId;
    final String? username;

    factory Coin.fromJson(Map<String, dynamic> json) => _$CoinFromJson(json);

    Map<String, dynamic> toJson() => _$CoinToJson(this);

}

/*
{
	"coinCount": 10,
	"level": 1,
	"nickname": "",
	"rank": "9999+",
	"userId": 163398,
	"username": "m**tl"
}*/