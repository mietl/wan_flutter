// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coin.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Coin _$CoinFromJson(Map<String, dynamic> json) => Coin(
      coinCount: (json['coinCount'] as num?)?.toInt(),
      level: (json['level'] as num?)?.toInt(),
      nickname: json['nickname'] as String?,
      rank: json['rank'] as String?,
      userId: (json['userId'] as num?)?.toInt(),
      username: json['username'] as String?,
    );

Map<String, dynamic> _$CoinToJson(Coin instance) => <String, dynamic>{
      'coinCount': instance.coinCount,
      'level': instance.level,
      'nickname': instance.nickname,
      'rank': instance.rank,
      'userId': instance.userId,
      'username': instance.username,
    };
