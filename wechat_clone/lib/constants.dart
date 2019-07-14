import 'package:flutter/material.dart';

class AppColors {
  static const AppBarColor = 0xff303030;
  static const TabIconActive = 0xfff45c11b;
  static const TabIconNormal = 0xff999999;
  static const AppBarPopupMenuColor = 0xffffffff;
  static const TitleTextColor = 0xff353535;
  static const ConvertsationItemBgColor = 0xffffffff;
  static const DesTextColor = 0xff9e9e9e;
  static const DividerColor = 0xffd9d9d9;
}

class AppStyles {
  static const TitleStyle =
      TextStyle(fontSize: 15.0, color: Color(AppColors.TitleTextColor));

  static const DesStyle =
      TextStyle(fontSize: 13.0, color: Color(AppColors.DesTextColor));
}

class Constants {
  static const IconFontFamily = 'appIconFont';
  static const ConversationAvatorSize = 48.0;
  static const DividerWidth = 1.0;
}
