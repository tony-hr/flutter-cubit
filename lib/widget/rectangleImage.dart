import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:test_tony/icons/linearIcons.dart';
import 'package:cached_network_image/cached_network_image.dart';

class RectangleImage extends StatelessWidget {
  final String? urlImage;
  final String imageAsset;
  final double height;
  final double width;
  final double radius;
  final bool border;
  RectangleImage({Key? key, this.urlImage, this.imageAsset = "", this.height = 100.0, this.width = 100.0, this.radius = 10.0, this.border = true}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: urlImage ?? "",
      imageBuilder: (context, imageProvider) => Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: imageProvider,
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.circular(radius)
        )
      ),
      placeholder: (context, url) => Container(
        height: height,
        width: width,
        child: Center(
          child: CupertinoActivityIndicator()
        )
      ),
      errorWidget: (context, url, error) => Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          border: Border.all(
            width: border ? 1.0 : 0.0,
            color: border ? Colors.grey[300]! : Colors.transparent
          ),
          borderRadius: BorderRadius.circular(radius)
        ),
        child: Icon(LinearIcons.warning, color: Colors.red)
      )
    );
  }
}