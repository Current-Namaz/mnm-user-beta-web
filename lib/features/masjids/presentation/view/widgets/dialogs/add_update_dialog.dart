import 'package:flutter/material.dart';
import 'package:mnm_internal_admin/core/utils/helpers/helper_functions.dart';
import 'package:mnm_internal_admin/features/masjids/domain/entities/area.dart';
import 'package:mnm_internal_admin/features/masjids/domain/entities/city.dart';
import 'package:mnm_internal_admin/features/masjids/domain/entities/country.dart';
import 'package:mnm_internal_admin/features/masjids/domain/entities/masjid.dart';
import 'package:mnm_internal_admin/features/masjids/domain/entities/state.dart';
import 'package:mnm_internal_admin/features/masjids/presentation/view/widgets/forms/area_form.dart';
import 'package:mnm_internal_admin/features/masjids/presentation/view/widgets/forms/city_form.dart';
import 'package:mnm_internal_admin/features/masjids/presentation/view/widgets/forms/country_form.dart';
import 'package:mnm_internal_admin/features/masjids/presentation/view/widgets/forms/masjid_form/masjid_form.dart';
import 'package:mnm_internal_admin/features/masjids/presentation/view/widgets/forms/state_form.dart';

import '../../../../../../core/values/constants.dart';

class AddUpdateDialog<T> extends StatelessWidget {
  const AddUpdateDialog({super.key, this.entity, this.insertPadding});

  final T? entity;
  final EdgeInsets? insertPadding;

  @override
  Widget build(BuildContext context) {
    return Dialog(
        elevation: 0,
        backgroundColor: Colors.transparent,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(r20),
                bottomLeft: Radius.circular(r20))),
        insetPadding: insertPadding ??
            EdgeInsets.only(
              left: MediaQuery.sizeOf(context).width * 0.75,
            ),
        child: (() {
          if (T == CountryEntity) {
            return CountryForm(entity: entity as CountryEntity?);
          }
          if (T == StateEntity) {
            return StateForm(entity: entity as StateEntity?);
          }
          if (T == CityEntity) {
            return CityForm(entity: entity as CityEntity?);
          }
          if (T == AreaEntity) {
            return AreaForm(entity: entity as AreaEntity?);
          }
          if (T == MasjidEntity)
            return MasjidForm(entity: entity as MasjidEntity?);
        }()));
  }
}
