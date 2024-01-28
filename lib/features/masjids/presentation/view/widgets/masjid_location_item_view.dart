import 'package:flutter/material.dart';
import 'package:mnm_internal_admin/core/values/app_colors.dart';
import 'package:mnm_internal_admin/core/values/app_strings.dart';
import 'package:mnm_internal_admin/core/values/app_styles.dart';
import 'package:mnm_internal_admin/core/widgets/app_text_field.dart';
import 'package:mnm_internal_admin/core/widgets/text_with_tool_tip_widget.dart';
import 'package:mnm_internal_admin/features/masjids/domain/entities/area.dart';
import 'package:mnm_internal_admin/features/masjids/domain/entities/city.dart';
import 'package:mnm_internal_admin/features/masjids/domain/entities/country.dart';
import 'package:mnm_internal_admin/features/masjids/domain/entities/state.dart';
import 'package:mnm_internal_admin/features/masjids/presentation/view/widgets/forms/area_form.dart';
import 'package:mnm_internal_admin/features/masjids/presentation/view/widgets/forms/city_form.dart';
import 'package:mnm_internal_admin/features/masjids/presentation/view/widgets/forms/country_form.dart';
import 'package:mnm_internal_admin/features/masjids/presentation/view/widgets/forms/state_form.dart';

import '../../../../../core/values/constants.dart';
import '../../../../../core/widgets/common_button.dart';

class MasjidLocationItemView<T> extends StatefulWidget {
  const MasjidLocationItemView(
      {super.key,
      required this.isSelected,
      required this.entity,
      required this.onTap,
      required this.onDoubleTap});

  final bool isSelected;
  final T entity;
  final VoidCallback onTap;
  final VoidCallback onDoubleTap;

  @override
  State<MasjidLocationItemView> createState() => _MasjidLocationItemViewState();
}

class _MasjidLocationItemViewState extends State<MasjidLocationItemView> {
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
                borderRadius : BorderRadius.circular(r8),
                color: widget.isSelected
                    ? AppColors.lightGreen
                    : isHovered
                        ? AppColors.lightGreen40
                        : null, //AppColors.darkBlackColor,
              ),
              child: Row(
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
            ),
          ),
        ),
       // if(isExpaned) ((){
       //   if(widget.entity is CountryEntity){
       //     return CountryForm(entity: widget.entity,);
       //   }else if(widget.entity is StateEntity){
       //     return StateForm(entity: widget.entity,);
       //   }else if(widget.entity is CityEntity){
       //     return CityForm(entity: widget.entity,);
       //   }else if(widget.entity is AreaEntity){
       //     return AreaForm(entity: widget.entity,);
       //   }
       //   return const SizedBox.shrink();
       // }())
      ],
    );
  }
}
