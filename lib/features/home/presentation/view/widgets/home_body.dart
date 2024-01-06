import 'package:flutter/material.dart';
import 'package:mnm_internal_admin/core/values/app_colors.dart';
import 'package:mnm_internal_admin/core/values/app_strings.dart';
import 'package:mnm_internal_admin/features/home/presentation/view/widgets/home_app_bar.dart';
import 'package:mnm_internal_admin/features/home/presentation/view/widgets/home_content_view.dart';
import 'package:mnm_internal_admin/features/home/presentation/view/widgets/home_side_menu.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 250,
          padding: const EdgeInsets.only(top: 20,left: 12,right: 12),
          decoration: BoxDecoration(
            color: AppColors.darkBlackColor,
          ),
          height: double.infinity,

          child:const HomeSideMenu(),),

        /// <<<<<<<<<<<<<<<<<<<< home main body >>>>>>>>>>>>>>>>>>>>>>>>>>>
        Expanded(
          child: Container(
            color: AppColors.primaryColor,
            child:  SingleChildScrollView(
              child: const Column(
                children: [
                  HomeAppBar(title: AppStrings.dashboard),
                  Row(
                    children: [
                      Expanded(child: HomeContentView()),
                    ],
                  )
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
