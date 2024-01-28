import 'package:flutter/material.dart';
import 'package:mnm_internal_admin/core/values/app_colors.dart';
import 'package:mnm_internal_admin/core/values/app_strings.dart';
import 'package:mnm_internal_admin/core/values/app_styles.dart';
import 'package:mnm_internal_admin/core/widgets/app_text_field.dart';
import 'package:mnm_internal_admin/core/widgets/text_with_tool_tip_widget.dart';
import 'package:mnm_internal_admin/features/masjids/domain/entities/area.dart';
import 'package:mnm_internal_admin/features/masjids/domain/entities/city.dart';
import 'package:mnm_internal_admin/features/masjids/domain/entities/country.dart';
import 'package:mnm_internal_admin/features/masjids/domain/entities/masjid.dart';
import 'package:mnm_internal_admin/features/masjids/domain/entities/state.dart';
import 'package:mnm_internal_admin/features/masjids/presentation/view/widgets/forms/area_form.dart';
import 'package:mnm_internal_admin/features/masjids/presentation/view/widgets/forms/city_form.dart';
import 'package:mnm_internal_admin/features/masjids/presentation/view/widgets/forms/country_form.dart';
import 'package:mnm_internal_admin/features/masjids/presentation/view/widgets/forms/state_form.dart';

import '../../../../../core/values/constants.dart';
import '../../../../../core/widgets/common_button.dart';

class MasjidItemView extends StatefulWidget {
  const MasjidItemView(
      {super.key,
        required this.isSelected,
        required this.entity,
        required this.onTap,
        required this.onDoubleTap});

  final bool isSelected;
  final MasjidEntity entity;
  final VoidCallback onTap;
  final VoidCallback onDoubleTap;

  @override
  State<MasjidItemView> createState() => _MasjidLocationItemViewState();
}

class _MasjidLocationItemViewState extends State<MasjidItemView> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: widget.onTap,
          onDoubleTap: () {
            widget.onDoubleTap();
          },
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
              alignment: Alignment.topLeft,
              margin: const EdgeInsets.only(bottom: 10),
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: BoxDecoration(
                border: Border.all(color: widget.isSelected || isHovered ?  Colors.transparent  :AppColors.textPrimary2Color),
                borderRadius : BorderRadius.circular(r8),
                color: widget.isSelected
                    ? AppColors.lightGreen
                    : isHovered
                    ? AppColors.lightGreen40
                    : null, //AppColors.darkBlackColor,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const SizedBox(
                        width: 5,
                      ),
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
                        child: AnimatedSwitcher(
                          duration: const Duration(milliseconds: 500),
                          child: widget.isSelected
                              ? const Icon(
                            Icons.navigate_next,
                            color: AppColors.white,
                            size: 20,
                          )
                              : const SizedBox.shrink(),
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 3,),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Container(
                      decoration: BoxDecoration(
                        color: AppColors.secondaryColor30,
                        borderRadius: BorderRadius.circular(r6)
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 10,vertical: 4),
                      child: Text(widget.entity.madhab,style: AppStyles.smallStyle.copyWith(color: AppColors.darkGreen,fontSize: 12),),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
