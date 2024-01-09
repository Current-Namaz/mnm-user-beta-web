import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mnm_internal_admin/core/values/app_colors.dart';
import 'package:mnm_internal_admin/core/values/app_styles.dart';
import 'package:mnm_internal_admin/features/masjids/presentation/view/widgets/masjid_location_item_Loading_view.dart';

import '../../../../../core/values/constants.dart';
import '../../view_models/masjid_view_model_cubit.dart';
import 'masjid_location_item_view.dart';

class StateListingView extends StatelessWidget {
  const StateListingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(r16),
        color: AppColors.darkBlackColor2,
      ),
      width: 300,
      height: double.infinity,
      child: Column(

        children: [
          Container(
              alignment: Alignment.center,
              width: double.infinity,
              padding: const EdgeInsets.all(8),
              margin: const EdgeInsets.only(bottom: 5),
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(topRight: Radius.circular(r12),topLeft: Radius.circular(r12)),
                  color: AppColors.greenColor
              ),
              child: const Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Spacer(),
                      Text('States',style: TextStyle(fontSize: 16,color: AppColors.textPrimary2Color,fontWeight: FontWeight.w500),),
                      Spacer(),
                      Align(
                        alignment: Alignment.centerRight,
                        child: AnimatedSwitcher(duration: const Duration(milliseconds: 500),
                          child: const Icon(Icons.add_box_rounded,color: AppColors.white,size: 20,),

                        ),)
                    ],
                  ),
                ],
              )),
          Expanded(
            child: BlocBuilder<MasjidViewModelCubit, MasjidViewModelState>(
              buildWhen: (oldState, newState) =>
                  newState is MasjidViewModelStateListLoaded ||
                  newState is MasjidViewModelStateListLoading ||
                  newState is MasjidViewModelStateListErrorState,
              builder: (context, state) {
                if (state is MasjidViewModelStateListLoading) {
                  return ListView.builder(
                      itemCount: 20,
                      itemBuilder: (context, index) {
                        return const MasjidLocationLoadingView();
                      });
                }

                if(state is MasjidViewModelStateListErrorState){
                  return Center(child: Text(state.message,style: AppStyles.mediumStyle,));
                }

                if (state is MasjidViewModelStateListLoaded) {
                  return ListView.builder(
                    itemCount: state.stateList.length,
                    itemBuilder: (context, index) {
                      return MasjidLocationItemView(
                        isSelected: state.selectedState == state.stateList[index],
                        entity: state.stateList[index],
                        onDoubleTap: () =>
                            BlocProvider.of<MasjidViewModelCubit>(context)
                                .onStateDoubleTap(state.stateList[index]),
                      );
                    },
                  );
                }
                return const Center(
                  child: Text('Select country',style: AppStyles.mediumStyle,),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
