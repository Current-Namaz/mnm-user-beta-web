import 'package:flutter/material.dart';
import 'package:mnm_internal_admin/core/values/app_colors.dart';
import 'package:mnm_internal_admin/core/values/app_styles.dart';
import 'package:mnm_internal_admin/core/widgets/text_with_tool_tip_widget.dart';
import 'package:shimmer/shimmer.dart';
import '../../../../../core/values/constants.dart';

class MasjidLocationLoadingView extends StatelessWidget {
  const MasjidLocationLoadingView(
      {super.key,});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: AppColors.primaryColor,
      period: const Duration(milliseconds: 3000),
      highlightColor: AppColors.iconColor,
      child: Container(
        width: double.infinity,
        alignment: Alignment.topLeft,
        margin: const EdgeInsets.only(bottom: 5),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(r8),
          color: AppColors.white ,//AppColors.darkBlackColor,
        ),
        child: const TextAutoTooltip(
          text:'loading',
          toolTipBackColor: AppColors.textPrimary2Color,
          maxLines: 1,
          tooltipText: null,
          textAlign: TextAlign.start,
          style: AppStyles.mediumStyle,
        ),
      ),
    );
  }
}
