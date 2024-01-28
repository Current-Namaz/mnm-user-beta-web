import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mnm_internal_admin/core/values/app_colors.dart';
import 'package:mnm_internal_admin/core/values/app_styles.dart';
import 'package:mnm_internal_admin/features/masjids/presentation/view/widgets/masjid_item_view.dart';
import 'package:mnm_internal_admin/features/masjids/presentation/view/widgets/masjid_location_item_Loading_view.dart';

import '../../../../../core/values/app_strings.dart';
import '../../../../../core/values/constants.dart';
import '../../../../../core/widgets/app_text_field.dart';
import '../../../../../core/widgets/common_button.dart';
import '../../view_models/masjid_view_model_cubit.dart';
import 'masjid_location_item_view.dart';

class MasjidsListingView extends StatefulWidget {
  const MasjidsListingView({super.key});

  @override
  State<MasjidsListingView> createState() => _MasjidsListingViewState();
}

class _MasjidsListingViewState extends State<MasjidsListingView>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(r16),
          color: AppColors.darkBlackColor2,
        ),
        width: 350,
        height: double.infinity,
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Container(
              alignment: Alignment.center,
              width: double.infinity,
              padding: const EdgeInsets.all(8),
              margin: const EdgeInsets.only(bottom: 5),
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(r12),
                      topLeft: Radius.circular(r12)),
                  color: AppColors.greenColor),
              child: const Text(
                AppStrings.masjids,
                style: TextStyle(
                    fontSize: 16,
                    color: AppColors.textPrimary2Color,
                    fontWeight: FontWeight.w500),
              )),
          AppTextField(
            topMargin: 5,
            hideLable: true,
            onChange: context.read<MasjidViewModelCubit>().onCitySearchChange,
            hintText: AppStrings.hSearch,
            height: 40,
          ),
          Expanded(
            child: BlocBuilder<MasjidViewModelCubit, MasjidViewModelState>(
              buildWhen: (oldState, newState) {
                return newState is MasjidViewModelMasjidsListLoaded ||
                    newState is MasjidViewModelMasjidsListLoading ||
                    newState is MasjidViewModelMasjidsListErrorState ||
                    newState is MasjidViewModelMasjidsListClearState ||
                    newState is MasjidViewModelAreaMasjidsListClearState ||
                    newState is MasjidViewModelCityAreaMasjidsListClearState;
              },
              builder: (context, state) {
                if (state is MasjidViewModelMasjidsListLoading) {
                  return ListView.builder(
                      itemCount: 20,
                      itemBuilder: (context, index) {
                        return const MasjidLocationLoadingView();
                      });
                }

                if (state is MasjidViewModelMasjidsListErrorState) {
                  return Center(
                      child: Text(
                    state.message,
                    style: AppStyles.mediumStyle,
                  ));
                }
                if (state is MasjidViewModelMasjidsListLoaded) {
                  if (state.masjidList.isEmpty) {
                    return Center(
                        child: Text(
                      AppStrings.emptyDataMessage(AppStrings.masjids),
                      style: AppStyles.mediumStyle,
                    ));
                  }
                  return ListView.builder(
                    itemCount: state.masjidList.length,
                    itemBuilder: (context, index) {
                      return MasjidItemView(
                        onDoubleTap: () =>
                            BlocProvider.of<MasjidViewModelCubit>(context)
                                .onMasjidDoubleTap(
                                    state.masjidList[index], context),
                        isSelected:
                            state.selectedCity == state.masjidList[index],
                        entity: state.masjidList[index],
                        onTap: () =>
                            BlocProvider.of<MasjidViewModelCubit>(context)
                                .onMasjidTap(state.masjidList[index]),
                      );
                    },
                  );
                }

                return const Center(
                  child: Text(
                    'Select Area',
                    style: AppStyles.mediumStyle,
                  ),
                );
              },
            ),
          ),
          BlocBuilder<MasjidViewModelCubit, MasjidViewModelState>(
            buildWhen: (oldState, newState) =>
                newState is MasjidViewModelMasjidsListLoaded ||
                newState is MasjidViewModelMasjidsListLoading ||
                newState is MasjidViewModelAreaListLoaded ||
                newState is MasjidViewModelMasjidsListErrorState ||
                newState is MasjidViewModelMasjidsListClearState ||
                newState is MasjidViewModelAreaMasjidsListClearState ||
                newState is MasjidViewModelCityAreaMasjidsListClearState,
            builder: (context, state) {
              if (state is MasjidViewModelMasjidsListLoaded ||
                  (state is MasjidViewModelAreaListLoaded &&
                      (state).selectedArea != null)) {
                return CommonButton(
                  height: 35,
                  radius: const BorderRadius.only(
                      bottomRight: Radius.circular(r12),
                      bottomLeft: Radius.circular(r12)),
                  onTap: () => BlocProvider.of<MasjidViewModelCubit>(context)
                      .onAddNewMasjidButtonTap(context),
                  text: AppStrings.addMasjid,
                );
              }

              return CommonButton(
                height: 35,
                // isDisabled: true,
                radius: const BorderRadius.only(
                    bottomRight: Radius.circular(r12),
                    bottomLeft: Radius.circular(r12)),
                onTap: () => BlocProvider.of<MasjidViewModelCubit>(context)
                    .onAddNewMasjidButtonTap(context),
                text: AppStrings.addMasjid,
              );
            },
          )
        ]));
  }

  @override
  bool get wantKeepAlive => true;
}
