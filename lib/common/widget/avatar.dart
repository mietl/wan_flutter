import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class AvatarWidget extends StatelessWidget{
  final double radius;
  final String avatarUrl;
  final void Function()? onPressed;
  final double? cacheSize;

  const AvatarWidget({super.key,required this.radius, required this.avatarUrl, this.onPressed, this.cacheSize});

  @override
  Widget build(BuildContext context) {
     return GestureDetector(
       onTap: onPressed,
       child: SizedBox(
         width: radius * 2,
         height: radius * 2,
         child: ClipOval(
           child: CachedNetworkImage(
               imageUrl: avatarUrl,
               width: cacheSize ?? (MediaQuery.of(context).devicePixelRatio * radius * 2),
               height: cacheSize ?? (MediaQuery.of(context).devicePixelRatio * radius * 2),
               fit: BoxFit.cover,
               placeholder: (context,url)=>Container(
                 color: Theme.of(context).colorScheme.primaryContainer,
               )
           ),
         ),
       ),
     );
  }


}