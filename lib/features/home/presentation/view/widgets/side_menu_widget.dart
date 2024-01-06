import 'package:flutter/material.dart';
import 'package:mnm_internal_admin/core/values/app_colors.dart';

import '../../../../../core/values/app_styles.dart';
import '../../../../../core/values/constants.dart';
import '../../../../../core/widgets/common_image.dart';


class SideMenuWidget extends StatefulWidget {
   const SideMenuWidget({super.key, required this.icon, required this.title, required this.onTap});

  final String icon;
  final String title;
  final VoidCallback onTap;

  @override
  State<SideMenuWidget> createState() => _SideMenuWidgetState();
}

class _SideMenuWidgetState extends State<SideMenuWidget> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10  ,vertical: 10),
      decoration: BoxDecoration(
        // color: AppColors.greenColor,
        borderRadius: BorderRadius.circular(r20)
      ),
      // padding: ,
      // margin: const EdgeInsets.only(bottom: 16,left: 20,right: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CommonImage.asset(widget.icon,height: 30,width: 30,),
          const SizedBox(width: 6,),
          Text(widget.title,style: AppStyles.title,)
        ],
      ),
    );
  }
}
