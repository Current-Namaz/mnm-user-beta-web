import 'package:flutter/material.dart';
import 'package:mnm_internal_admin/core/values/app_colors.dart';
import 'package:mnm_internal_admin/features/city_config/presentation/view/widgets/config_form/config_form.dart';
import 'package:mnm_internal_admin/features/city_config/presentation/view/widgets/config_header_view.dart';

class MasjidConfigView extends StatelessWidget {
  const MasjidConfigView({super.key});



  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(16),
        alignment: Alignment.center,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ConfigHeaderView(),
            Expanded(
              child: ScrollConfiguration(
                behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
                child: ConfigForm(),
              ),
            )
          ],
        ));
  }
}
