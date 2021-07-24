import 'package:flutter/material.dart';
import 'package:test_tony/theme/typography.dart';
import 'package:test_tony/widget/button.dart';

class LoadContentError extends StatelessWidget {
  final String title;
  final String? description;
  final bool withImage;
  final GestureTapCallback? onPressed;
  LoadContentError({
    required this.title,
    this.description,
    this.onPressed,
    this.withImage = true
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          withImage ? 
          Container(
            margin: const EdgeInsets.only(top: 20.0),
            width: 240.0,
            child: Image.asset("assets/images/failed.png")
          ) : SizedBox(),

          SizedBox(height: 15.0),
          Text(title, style: TextStyles.label),
          Text(description!, style: TextStyles.caption, textAlign: TextAlign.center),

          SizedBox(height: 20.0),
          SizedBox(
            height: 28.0,
            child: ButtonIcon(
              title: 'Coba Lagi',
              outline: true,
              onPressed: onPressed!
            )
          ),

          SizedBox(height: 20.0),
        ],
      )
    );
  }
}

class LoadContentNoData extends StatelessWidget {
  final String title;
  final String? description;
  final bool withImage;
  final GestureTapCallback? onPressed;
  LoadContentNoData({
    required this.title,
    this.description,
    this.onPressed,
    this.withImage = true
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          withImage ? 
          Container(
            margin: const EdgeInsets.only(top: 20.0),
            width: 240.0,
            child: Image.asset("assets/images/no-data.png")
          ) : SizedBox(),

          SizedBox(height: 15.0),
          Text(title, style: TextStyles.label),
          Text(description!, style: TextStyles.caption),

          SizedBox(height: 20.0)
        ],
      )
    );
  }
}