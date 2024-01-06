import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mnm_internal_admin/core/values/app_images.dart';
import 'package:mnm_internal_admin/core/values/app_strings.dart';
import 'package:mnm_internal_admin/core/values/app_styles.dart';
import 'package:mnm_internal_admin/features/auth/presentation/view_model/auth_cubit.dart';

import '../../../../core/common_domain/base_components/responsive_widget.dart';
import '../../../../core/values/app_colors.dart';
import '../../../../core/values/constants.dart';
import '../../../../core/widgets/app_text_field.dart';
import '../../../../core/widgets/common_button.dart';

class LoginBody extends StatelessWidget {
  const LoginBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Responsive(
        mobile: Container(),
        tablet: _buildDesktopBody(context),
        desktop: _buildDesktopBody(context));
  }

  Widget _buildDesktopBody(context) {
    return Center(
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.only(right: 25),
              height: 220.0,
              width: 220,
              alignment: Alignment.center,
              child: Image.asset(AppImages.appLogoPng),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(AppStrings.masjidNearMeSuperAdmin,style: AppStyles.h1,),
                const SizedBox(height: 30,),
                Container(
                  width: 450,
                  decoration: BoxDecoration(
                      color: AppColors.secondary2Color,
                      borderRadius: BorderRadius.circular(r8)),
                  padding: const EdgeInsets.all(30),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const AppTextField(
                        hintText: AppStrings.hEnterEmail,
                      ),
                      const AppTextField(
                        isForPassword: true,
                        hintText: AppStrings.hEnterPassword,
                      ),
                      CommonButton(onTap:() => BlocProvider.of<AuthCubit>(context).onLoginTap(context), text: AppStrings.login)
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
