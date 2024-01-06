import 'package:flutter/cupertino.dart';

import 'app_colors.dart';

class AppStyles {
  final titleStyle = const TextStyle(color: AppColors.primaryColor, fontSize: 20, fontWeight: FontWeight.w600);


  static const h1 = TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.w700,
    color: AppColors.textPrimaryColor,
  );
  static const title = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimaryColor
  );

  static const sliderBannerItemStyle = TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w600,
      color: AppColors.textPrimary2Color
  );
  static const smallStyle = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: AppColors.textPrimary2ColorWithLowOpacity,
  );

  static const mediumStyle = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimaryColor,
  );
}
