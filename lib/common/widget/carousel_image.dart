import 'package:flutter/material.dart';

class CarouselImage extends StatefulWidget{
  final List<String> images;
  final ValueChanged<int>? onTap;
  final double height;
  
  const CarouselImage({super.key,required this.height , required this.images , this.onTap });

  @override
  State<StatefulWidget> createState() {
    return _CarouseImageState();
  }
}

class _CarouseImageState extends State<CarouselImage> {
  final CarouselController controller = CarouselController(initialItem: 1);

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      height: widget.height,
      child: CarouselView(
        scrollDirection: Axis.horizontal,
        itemExtent: double.infinity,
        onTap: widget.onTap,
        children: widget.images.map((src){
          return Image.network(src);
        }).toList()
      ),
    );
  }
}