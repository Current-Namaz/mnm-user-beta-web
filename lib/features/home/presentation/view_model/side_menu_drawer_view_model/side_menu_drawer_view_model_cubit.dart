import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mnm_internal_admin/core/values/app_strings.dart';
import 'package:mnm_internal_admin/features/masjids/presentation/view_models/masjid_view_model_cubit.dart';

import '../../../../../di.dart';

part 'side_menu_drawer_view_model_state.dart';

class SideMenuDrawerViewModelCubit extends Cubit<SideMenuDrawerViewModelState> {
  SideMenuDrawerViewModelCubit()
      : super(const SideMenuDrawerViewModelInitial(selectedIndex: 0,appBarTitle: AppStrings.dashboard));

  void onDashBoardTap() {
    emit(const SideMenuDrawerViewModelInitial(selectedIndex: 0,appBarTitle: AppStrings.dashboard));
  }

  void onMasjidsTap() {
    sl<MasjidViewModelCubit>().getCountryData();
    emit(const SideMenuDrawerViewModelInitial(selectedIndex: 1,appBarTitle: AppStrings.masjids));
  }
}
