import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'side_menu_drawer_view_model_state.dart';

class SideMenuDrawerViewModelCubit extends Cubit<SideMenuDrawerViewModelState> {
  SideMenuDrawerViewModelCubit() : super(SideMenuDrawerViewModelInitial());
}
