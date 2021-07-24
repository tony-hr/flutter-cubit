import 'package:flutter/material.dart';
import 'package:test_tony/theme/style.dart' as Theme;
import 'package:test_tony/theme/typography.dart';

class Button extends StatelessWidget {
  final GestureTapCallback? onPressed;
  final String title;
  final double elevation;
  final double borderRadius;
  final bool outline;
  final Color color;
  final bool loading;
  Button({
    required this.title,
    required this.onPressed,
    this.elevation = 0.0,
    this.borderRadius = 5.0,
    this.outline = false,
    this.color = Theme.Colors.primary,
    this.loading = false
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: loading ? null : onPressed,
      style: ElevatedButton.styleFrom(
        elevation: elevation,
        primary: outline ? Colors.transparent : color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          side: BorderSide(color: color, width: outline ? 1.0 : 0.0)
        ),
        padding: EdgeInsets.symmetric(vertical: loading ? 8.0 : 13.0, horizontal: 10.0),
      ),
      child: Text(title, style: TextStyle(
        color: outline ? color : Colors.white,
        fontWeight: FontWeight.w400,
        fontSize: FontSize.button
      )),
    );
  }
}

class ButtonIcon extends StatelessWidget {
  final GestureTapCallback onPressed;
  final String title;
  final double elevation;
  final double borderRadius;
  final bool outline;
  final Color color;
  final bool loading;
  final double titleSize;
  final double iconSize;
  ButtonIcon({
    required this.title,
    required this.onPressed,
    this.elevation = 0.0,
    this.borderRadius = 5.0,
    this.outline = false,
    this.color = Theme.Colors.primary,
    this.loading = false,
    this.titleSize = FontSize.label,
    this.iconSize = 14.0
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: loading ? null : onPressed,
      style: ElevatedButton.styleFrom(
        side: BorderSide(color: color, width: outline ? 1.0 : 0.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          side: BorderSide(color: color, width: outline ? 1.0 : 0.0)
        ),
        primary: outline ? Colors.transparent : color,
        elevation: elevation
      ),
      icon: Icon(
        Icons.replay,
        color: outline ? color : Colors.white,
        size: iconSize,
      ),
      label: Text(title, style: TextStyle(
        color: outline ? color : Colors.white,
        fontSize: titleSize
      )),
    );
  }
}

class FlatBtn extends StatelessWidget {
  final GestureTapCallback onPressed;
  final String title;
  final Color color;
  FlatBtn({
    required this.title,
    required this.onPressed,
    this.color = Theme.Colors.primary
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        title,
        style: TextStyle(color: color, fontWeight: FontWeight.w400)
      )
    );
  }
}

class BtnSubmit extends StatelessWidget {
  final String title;
  final GestureTapCallback onPressed;
  const BtnSubmit({
    Key? key,
    required this.title,
    required this.onPressed
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerRight,
      child: InkWell(
        onTap: onPressed,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(title, style: TextStyle(fontWeight: FontWeight.w600, fontSize: 17.0)),
            Container(
              margin: EdgeInsets.only(left: 10.0), 
              padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 3.0),
              decoration: new BoxDecoration(
                gradient: new LinearGradient(
                  colors: [
                    const Color(0xFF3366FF),
                    const Color(0xFF00CCFF),
                  ],
                  begin: const FractionalOffset(0.0, 0.0),
                  end: const FractionalOffset(1.0, 0.0),
                  stops: [0.0, 1.0],
                  tileMode: TileMode.clamp
                ),
                borderRadius: BorderRadius.circular(20.0)
              ),
              child: Icon(Icons.arrow_forward, color: Colors.white, size: 28.0),
            )
          ],
        ),
      ),
    );
  }
}