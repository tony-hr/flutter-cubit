import 'package:flutter/material.dart';
import 'package:test_tony/theme/typography.dart';
import 'package:test_tony/widget/rectangleImage.dart';

class AwesomeListItem extends StatelessWidget {
  final String? title;
  final String? description;
  final String? image;
  AwesomeListItem({this.title, this.description, this.image});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(title ?? "", style: TextStyles.infoTitle),
                Padding(
                  padding: const EdgeInsets.only(top: 5.0),
                  child: Text(description ?? "", style: TextStyles.caption)
                ),
              ],
            ),
          ),
        ),
        
        Container(
          height: 135.0,
          width: 150.0,
          child: Stack(
            children: <Widget>[
              Transform.translate(
                offset: Offset(50.0, 0.0),
                child: Container(
                  height: 100.0,
                  width: 100.0,
                  color: Colors.grey,
                ),
              ),

              Transform.translate(
                offset: Offset(13.0, 10.0),
                child: Card(
                  elevation: 15.0,
                  child: Container(
                    height: 95.0,
                    width: 120.0,
                    color: Colors.white,
                    child: RectangleImage(
                      urlImage: image,
                      radius: 0.0,
                      border: false
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}