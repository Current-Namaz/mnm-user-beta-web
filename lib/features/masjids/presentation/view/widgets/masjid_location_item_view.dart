import 'package:flutter/material.dart';
import 'package:mnm_internal_admin/core/values/app_colors.dart';
import 'package:mnm_internal_admin/core/values/app_styles.dart';
import 'package:mnm_internal_admin/core/widgets/text_with_tool_tip_widget.dart';

import '../../../../../core/values/constants.dart';

class MasjidLocationItemView<T> extends StatefulWidget {
  const MasjidLocationItemView(
      {super.key,
      required this.isSelected,
      required this.entity,
      required this.onDoubleTap});

  final bool isSelected;
  final T entity;
  final VoidCallback onDoubleTap;

  @override
  State<MasjidLocationItemView> createState() => _MasjidLocationItemViewState();
}

class _MasjidLocationItemViewState extends State<MasjidLocationItemView> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
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
          // alignment: Alignment.center,
          alignment: Alignment.topLeft,
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(r8),
            color: widget.isSelected
                ? AppColors.lightGreen
                : isHovered
                    ? AppColors.lightGreen40
                    : null ,//AppColors.darkBlackColor,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
                SizedBox(
                  height: 20,
                  width: 20,
                  child: isHovered ?InkResponse(
                    onTap: () {},
                    child: const Icon(
                      Icons.more_vert_rounded,
                      color: AppColors.white,
                      size: 20,
                    ),) : null,
                ),
              const SizedBox(width: 5,),
              Expanded(
                child: TextAutoTooltip(
                  text: widget.entity.name,
                  toolTipBackColor: AppColors.textPrimary2Color,
                  maxLines: 1,
                  tooltipText: widget.entity.name,
                  textAlign: TextAlign.start,
                  style: AppStyles.mediumStyle,
                ),
              ),
               Align(
                  alignment: Alignment.centerRight,
                  child: AnimatedSwitcher(duration: const Duration(milliseconds: 500),
                  child: widget.isSelected ? const Icon(Icons.navigate_next,color: AppColors.white,size: 20,):SizedBox.shrink(),

                  ),)
            ],
          ),
        ),
      ),
    );
  }
}
