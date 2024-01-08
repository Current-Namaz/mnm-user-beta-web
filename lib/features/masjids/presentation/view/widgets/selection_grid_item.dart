import 'package:flutter/material.dart';
import 'package:mnm_internal_admin/core/values/app_colors.dart';
import 'package:mnm_internal_admin/core/values/app_styles.dart';
import 'package:mnm_internal_admin/core/widgets/text_with_tool_tip_widget.dart';

import '../../../../../core/values/constants.dart';

class SelectionGridItem<T> extends StatefulWidget {
  const SelectionGridItem(
      {super.key,
      required this.isSelected,
      required this.entity,
      required this.onDoubleTap});

  final bool isSelected;
  final T entity;
  final VoidCallback onDoubleTap;

  @override
  State<SelectionGridItem> createState() => _SelectionGridItemState();
}

class _SelectionGridItemState extends State<SelectionGridItem> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){},
      onDoubleTap: widget.onDoubleTap,
      child: MouseRegion(
        onHover: (_) {
          setState(() {
            isHovered = true;
          });
        },
        onExit: (_) {
          setState(() {
            isHovered = false;
          });
        },
        child: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(r8),
            color: widget.isSelected
                ? AppColors.lightGreen
                : isHovered
                    ? AppColors.lightGreen40
                    : AppColors.darkBlackColor,
          ),
          child: TextAutoTooltip(
            text:widget.entity.name,
            toolTipBackColor: AppColors.textPrimary2Color,
            maxLines: 2,
            tooltipText: widget.entity.name,
            textAlign: TextAlign.center,
            style: AppStyles.mediumStyle,
          ),
        ),
      ),
    );
  }
}
