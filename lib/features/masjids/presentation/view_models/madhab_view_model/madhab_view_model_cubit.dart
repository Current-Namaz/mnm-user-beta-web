import 'package:adhan_dart/adhan_dart.dart';
import 'package:bloc/bloc.dart';
import 'package:mnm_internal_admin/core/values/enums.dart';
import 'package:mnm_internal_admin/features/masjids/presentation/view_models/masjid_view_model/masjid_view_model_cubit.dart';

import '../../../../../di.dart';
import '../prayer_times_view_model_cubit.dart';

class MadhabViewModelCubit extends Cubit<MadhabEnum> {
  MadhabViewModelCubit() : super(MadhabEnum.hanafi);

    void onValueChange(MadhabEnum? madhab){
      sl<PrayerTimesViewModelCubit>().getPrayerTimes( sl<MadhabViewModelCubit>().state, Coordinates(double.parse(sl<MasjidViewModelCubit>().selectedCity!.latitude), double.parse(sl<MasjidViewModelCubit>().selectedCity!.longitude)), sl<MasjidViewModelCubit>().selectedCity!.timeZone);
      emit(madhab ?? state);

  }
}
