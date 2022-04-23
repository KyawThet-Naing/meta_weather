import 'package:cached_network_image/cached_network_image.dart';
import 'package:meta_weather/utils/const.dart';
import 'package:flutter/material.dart';

class ImageView extends StatelessWidget {
  final String img;
  final double width, height;
  const ImageView(
      {Key? key, required this.img, this.width = 60, this.height = 60})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: CachedNetworkImage(
        imageUrl: '${Const.imgUrl}/$img.png',
        placeholder: (_, __) {
          return const Center(
            child: CircularProgressIndicator(
              strokeWidth: 3,
              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
            ),
          );
        },
        errorWidget: (_, __, ___) {
          return const Center(
            child: Icon(Icons.error),
          );
        },
        fadeInDuration: const Duration(seconds: 2),
        fadeInCurve: Curves.bounceInOut,
      ),
    );
  }
}
