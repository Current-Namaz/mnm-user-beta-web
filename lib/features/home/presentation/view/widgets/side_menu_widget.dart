import 'package:flutter/material.dart';
import 'package:mnm_internal_admin/core/values/app_colors.dart';

import '../../../../../core/values/app_styles.dart';
import '../../../../../core/values/constants.dart';
import '../../../../../core/widgets/common_image.dart';


class SideMenuWidget extends StatefulWidget {
   const SideMenuWidget({super.key, required this.icon, required this.title, required this.onTap, this.isSelected = false});

  final String icon;
  final String title;
  final VoidCallback onTap;
  final bool isSelected;

  @override
  State<SideMenuWidget> createState() => _SideMenuWidgetState();
}

class _SideMenuWidgetState extends State<SideMenuWidget> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: MouseRegion(
        onEnter: (pointer){
         setState(() {
           isHovered = true;
         });
        },
        onExit: (onExit){
          setState(() {
            isHovered = false;
          });
        },
        child: Container(
          margin: const EdgeInsets.only(bottom: 4),
          padding: const EdgeInsets.symmetric(horizontal: 10  ,vertical: 6),
          decoration: BoxDecoration(
            color:  isHovered && !widget.isSelected? AppColors.secondaryColor30 : null,
            borderRadius: BorderRadius.circular(r16),
            gradient: widget.isSelected ?LinearGradient(
               stops: const [
                 0.2,
                 0.9,
               ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
              AppColors.lightGreen,
              AppColors.secondaryColor30
            ]) : null
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CommonImage.asset(widget.icon,height: 20,width: 20,),
              const SizedBox(width: 6,),
              Text(widget.title,style: AppStyles.title.copyWith(fontWeight: FontWeight.w500),)
            ],
          ),
        ),
      ),
    );
  }
}
