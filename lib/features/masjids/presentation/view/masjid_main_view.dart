import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mnm_internal_admin/core/values/app_colors.dart';
import 'package:mnm_internal_admin/core/values/app_styles.dart';
import 'package:mnm_internal_admin/features/masjids/presentation/view/widgets/selection_grid_item.dart';
import 'package:mnm_internal_admin/features/masjids/presentation/view_models/masjid_view_model_cubit.dart';

import '../../../../core/values/constants.dart';

class MasjidMainView extends StatelessWidget {
  const MasjidMainView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Country list',
            style: AppStyles.mediumStyle,
          ),
          Expanded(
            flex: 4,
            child: Row(
              children: [
                Expanded(
                  flex: 3,
                  child: BlocBuilder<MasjidViewModelCubit, MasjidViewModelState>(
                    builder: (context, state) {
                      if(state is MasjidViewModelCountryListLoading){
                        return Center(child: CircularProgressIndicator(color: AppColors.lightGreen,));
                      }
                      if(state is MasjidViewModelCountryErrorState){
                        return Center(child: Text(state.message,style: AppStyles.mediumStyle,));
                      }
                      
                      if(state is MasjidViewModelCountryListLoaded) {
                        return GridView.builder(
                          padding: const EdgeInsets.only(top: 20, right: 20),
                          itemCount: state.countryList.length,
                          gridDelegate:
                          const SliverGridDelegateWithMaxCrossAxisExtent(
                              maxCrossAxisExtent: 110,
                              childAspectRatio: 1,
                              crossAxisSpacing: 15,
                              mainAxisSpacing: 10),
                          itemBuilder: (context, index) {
                            return SelectionGridItem(
                              isSelected: index == 3,
                              text: state.countryList[index].name, onTap: () {},
                            );
                          });
                      }
                      return const SizedBox();
                    },
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    alignment: Alignment.center,
                    margin: const EdgeInsets.only(top: 20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(r16),
                      color: AppColors.darkBlackColor,
                    ),
                    child: const Text('Edit form', style: AppStyles.smallStyle,),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
