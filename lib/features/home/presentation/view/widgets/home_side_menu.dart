import 'package:flutter/material.dart';
import 'package:mnm_internal_admin/core/values/app_colors.dart';
import 'package:mnm_internal_admin/core/values/app_images.dart';
import 'package:mnm_internal_admin/core/values/app_strings.dart';
import 'package:mnm_internal_admin/core/values/app_styles.dart';
import 'package:mnm_internal_admin/core/widgets/global_logo.dart';
import 'package:mnm_internal_admin/core/widgets/common_image.dart';
import 'package:mnm_internal_admin/features/home/presentation/view/widgets/side_menu_widget.dart';


class HomeSideMenu extends StatelessWidget {
  const HomeSideMenu({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const GlobalLogo(),
        const Divider(color: AppColors.secondary2Color,thickness: 2,height: 50,),
        Expanded(
          child: ListView(
            children: [
              SideMenuWidget(icon: AppImages.dashboard, title: AppStrings.dashboard, onTap: (){}),
              SideMenuWidget(icon: AppImages.masjid, title: AppStrings.masjids, onTap: (){}),
            ],
          ),
        )
      ],
    );
  }
}
