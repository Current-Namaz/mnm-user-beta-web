import 'package:flutter/material.dart';
import 'package:mnm_internal_admin/core/values/app_images.dart';
import 'package:mnm_internal_admin/core/widgets/common_image.dart';

class GlobalLogo extends StatelessWidget {
  const GlobalLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
         CommonImage.asset(AppImages.appForGroundLogo,height: 45,width: 40,),
         const SizedBox(width: 3,),
         CommonImage.asset(AppImages.appTextLogo,height: 50,)
        ],
      ),
    );
  }
}
