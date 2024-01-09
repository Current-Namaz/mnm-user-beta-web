import 'package:flutter/material.dart';
import 'package:mnm_internal_admin/core/values/app_colors.dart';
import 'package:mnm_internal_admin/core/values/app_styles.dart';
import 'package:mnm_internal_admin/core/widgets/text_with_tool_tip_widget.dart';

import '../../../../../core/values/constants.dart';

class MasjidLocationLoadingView extends StatefulWidget {
  const MasjidLocationLoadingView(
      {super.key,});

  @override
  State<MasjidLocationLoadingView> createState() => _MasjidLocationLoadingViewState();
}

class _MasjidLocationLoadingViewState extends State<MasjidLocationLoadingView> {

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 100,
      child: Text('working'),
      alignment: Alignment.topLeft,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(r8),
        color: AppColors.white ,//AppColors.darkBlackColor,
      ),
    );
  }
}
