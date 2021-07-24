import 'package:flutter/material.dart';
import 'package:test_tony/theme/style.dart' as Theme;
import 'package:test_tony/theme/typography.dart';

class TitleBoxInfo extends StatelessWidget {
  final String title;
  final EdgeInsets? margin;
  final EdgeInsets padding;
  TitleBoxInfo({
    required this.title,
    this.margin,
    this.padding = const EdgeInsets.only(top: 8.0, left: 18.0),
  });

  @override
  Widget build(BuildContext context) {
    return  Container(
      margin: margin,
      padding: padding,
      child: Text(title, style: TextStyles.caption)
    );
  }
}

class BoxInfo extends StatelessWidget {
  final Widget child;
  final EdgeInsets margin;
  final EdgeInsets padding;
  final bool border;
  BoxInfo({
    required this.child,
    this.margin = const EdgeInsets.only(top: 8.0, bottom: 20.0),
    this.padding = const EdgeInsets.symmetric(horizontal: 18.0, vertical: 10.0),
    this.border = true
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: margin,
      padding: padding,
      decoration: BoxDecoration(
        color: Colors.white,
        border: this.border ? Border(
          top: BorderSide(width: 1.0, color: Theme.Colors.border),
          bottom: BorderSide(width: 1.0, color: Theme.Colors.border)
        ) : Border.all(width: 0.0, color: Colors.transparent)
      ),
      child: child
    );
  }
}

class LabelValue extends StatelessWidget {
  const LabelValue({ Key? key, required this.title, required  this.value, this.titleBold = true }) : super(key: key);
  final String title;
  final String value;
  final bool titleBold;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: titleBold ? TextStyles.labelTitleBold : TextStyles.labelTitleRegular),
        Text(value, style: TextStyles.labelValue)
      ],
    );
  }
}