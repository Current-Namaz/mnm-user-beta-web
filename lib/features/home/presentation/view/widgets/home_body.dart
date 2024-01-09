import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mnm_internal_admin/core/values/app_colors.dart';
import 'package:mnm_internal_admin/core/values/app_strings.dart';
import 'package:mnm_internal_admin/core/values/app_styles.dart';
import 'package:mnm_internal_admin/features/auth/presentation/view_model/auth_cubit.dart';
import 'package:mnm_internal_admin/features/home/presentation/view/widgets/home_app_bar.dart';
import 'package:mnm_internal_admin/features/home/presentation/view/widgets/home_content_view.dart';
import 'package:mnm_internal_admin/features/home/presentation/view/widgets/home_side_menu.dart';
import 'package:mnm_internal_admin/features/home/presentation/view_model/side_menu_drawer_view_model/side_menu_drawer_view_model_cubit.dart';
import 'package:mnm_internal_admin/features/masjids/presentation/view/masjid_main_view.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 280,
          padding: const EdgeInsets.only(top: 20, left: 12, right: 12),
          decoration: const BoxDecoration(
            color: AppColors.darkBlackColor,
          ),
          height: double.infinity,
          child: const HomeSideMenu(),
        ),

        /// <<<<<<<<<<<<<<<<<<<< home main body >>>>>>>>>>>>>>>>>>>>>>>>>>>

        Expanded(
          child: Container(
            color: AppColors.primaryColor,
            child: BlocBuilder<SideMenuDrawerViewModelCubit,
                SideMenuDrawerViewModelState>(
              builder: (context, state) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    HomeAppBar(title: state.appBarTitle),
                    Expanded(
                        child: HomeContentView(
                      child: (() {
                        if (state.appBarTitle == AppStrings.dashboard) {
                          return const Text('DashBoard coming soon',
                              style: AppStyles.title);
                        } else if (state.appBarTitle == AppStrings.masjids) {
                          return const MasjidMainView();
                        }
                        return const SizedBox();
                      }()),
                    )),
                  ],
                );
              },
            ),
          ),
        )
      ],
    );
  }
}
