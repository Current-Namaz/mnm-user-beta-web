part of 'side_menu_drawer_view_model_cubit.dart';

abstract class SideMenuDrawerViewModelState extends Equatable {
  final int selectedIndex;
  final String appBarTitle;
  const SideMenuDrawerViewModelState({required this.selectedIndex,required this.appBarTitle});
}

class SideMenuDrawerViewModelInitial extends SideMenuDrawerViewModelState {
  const SideMenuDrawerViewModelInitial({required super.selectedIndex, required super.appBarTitle});


  @override
  List<Object> get props => [super.selectedIndex,super.appBarTitle];
}
