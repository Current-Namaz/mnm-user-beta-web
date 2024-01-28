import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mnm_internal_admin/core/values/app_colors.dart';
import 'package:mnm_internal_admin/core/widgets/common_button.dart';
import 'package:mnm_internal_admin/features/masjids/domain/entities/masjid.dart';
import 'package:mnm_internal_admin/features/masjids/presentation/view/widgets/forms/masjid_form/components/admin_form.dart';
import 'package:mnm_internal_admin/features/masjids/presentation/view/widgets/forms/masjid_form/components/eid_timing_form.dart';
import 'package:mnm_internal_admin/features/masjids/presentation/view/widgets/forms/masjid_form/components/madhab_selection_form.dart';
import 'package:mnm_internal_admin/features/masjids/presentation/view/widgets/forms/masjid_form/components/masjid_details_form.dart';
import 'package:mnm_internal_admin/features/masjids/presentation/view/widgets/forms/masjid_form/components/namaz_timing_form.dart';

import '../../../../../../../core/values/app_strings.dart';
import '../../../../../../../core/values/app_styles.dart';
import '../../../../../../../core/values/constants.dart';

class MasjidForm extends StatefulWidget {
  const MasjidForm({super.key, this.entity});

  final MasjidEntity? entity;

  @override
  State<MasjidForm> createState() => _MasjidFormState();
}

class _MasjidFormState extends State<MasjidForm> {
  final ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      controller: scrollController,
      child: Container(
        height: double.infinity,
        margin: EdgeInsets.all(20),
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(r20),
          color: AppColors.secondaryColor,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                    widget.entity == null
                        ? AppStrings.addNewMasjid
                        : AppStrings.updateMasjid,
                    style: AppStyles.title),
                const Spacer(),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(r8)),
                    child: const Icon(
                      Icons.close,
                      color: AppColors.white,
                      size: 18,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: ScrollConfiguration(
                behavior:
                    ScrollConfiguration.of(context).copyWith(scrollbars: false),
                child: SingleChildScrollView(
                  controller: scrollController,
                  scrollDirection: Axis.vertical,
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: 4,
                            child: Container(
                              margin: EdgeInsets.only(right: 10),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(child: AdminForm()),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Expanded(
                                      flex: 3,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          MasjidDetailsForm(),
                                          SizedBox(height: 10,),
                                          MadhabSelectionForm(),
                                        ],
                                      )),
                                ],
                              ),
                            ),
                          ),
                          Expanded(flex: 2, child: NamazTimingForm()),
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(
                              margin: EdgeInsets.only(right: 10),
                              child: Column(
                                children: [
                                  EidTimingForm(),
                                  CommonButton(
                                      height: 40,
                                      topMargin: 20,
                                      onTap: () {},
                                      text: AppStrings.create),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
