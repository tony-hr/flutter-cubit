import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test_tony/theme/style.dart' as Theme;

class FontSize {
  FontSize();

  static const bigTitle = 29.0;
  static const h1 = 24.0;
  static const h2 = 22.0;
  static const h3 = 20.0;
  static const h4 = 18.0;
  static const body1 = 14.0;
  static const body2 = 12.0;
  static const button = 16.0;
  static const caption = 12.0;
  static const label = 15.0;
}

class TextStyles {
  static final titleGF = GoogleFonts.redressed(
    color: Theme.Colors.body,
    fontSize: 30.0
  );

  static const TextStyle infoTitle = TextStyle(
    color: Theme.Colors.font1,
    fontSize: FontSize.label,
    fontWeight: FontWeight.w600
  );

  static const TextStyle h1 = TextStyle(
    color: Theme.Colors.font1,
    fontSize: FontSize.h1,
    fontWeight: FontWeight.w500
  );

  static const TextStyle h2 = TextStyle(
      color: Theme.Colors.font1,
      fontSize: FontSize.h2,
      fontWeight: FontWeight.w500
  );

  static const TextStyle h3 = TextStyle(
      color: Theme.Colors.font1,
      fontSize: FontSize.h3,
      fontWeight: FontWeight.w500
  );

  static const TextStyle h4 = TextStyle(
      color: Theme.Colors.font1,
      fontSize: FontSize.h4,
      fontWeight: FontWeight.w500
  );

  static const TextStyle textBody = TextStyle(
    color: Theme.Colors.font1,
    fontSize: FontSize.body1
  );

  static const TextStyle textBodyGrey = TextStyle(
    color: Theme.Colors.font2,
    fontSize: FontSize.body1
  );

  static const TextStyle textBodyThin = TextStyle(
    color: Theme.Colors.font1,
    fontSize: FontSize.body1,
    fontWeight: FontWeight.w300
  );

  static const TextStyle label = TextStyle(
    color: Colors.black,
    fontSize: FontSize.label,
    fontWeight: FontWeight.w500
  );

  static const TextStyle labelLight = TextStyle(
    color: Colors.white,
    fontSize: FontSize.label,
    fontWeight: FontWeight.w500
  );

  static const TextStyle labelTitleBold = TextStyle(
    fontSize: FontSize.label,
    fontWeight: FontWeight.w600
  );

  static const TextStyle labelTitleRegular = TextStyle(
    fontSize: FontSize.label
  );

  static const TextStyle labelValue = TextStyle(
    color: Theme.Colors.font2,
    fontSize: FontSize.label,
    fontWeight: FontWeight.w300
  );

  static const TextStyle caption = TextStyle(
    color: Theme.Colors.font2,
    fontSize: FontSize.caption,
    fontWeight: FontWeight.w300
  );

  static const TextStyle captionLight = TextStyle(
    color: Colors.white,
    fontSize: FontSize.caption,
    fontWeight: FontWeight.w300
  );

  static const TextStyle captionDark = TextStyle(
    color: Theme.Colors.font1,
    fontSize: FontSize.caption,
    fontWeight: FontWeight.w300
  );

  static const TextStyle error = TextStyle(
    color: Theme.Colors.fontError,
    fontSize: FontSize.caption,
    fontStyle: FontStyle.italic
  );
}