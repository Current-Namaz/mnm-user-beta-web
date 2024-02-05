import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mnm_internal_admin/core/values/app_colors.dart';
import 'package:mnm_internal_admin/core/values/app_styles.dart';

class SwitchWithLable extends StatefulWidget {
  const SwitchWithLable(
      {super.key,
      required this.lable,
      required this.value,
      required this.onChange});

  final String lable;
  final bool value;
  final ValueChanged onChange;

  @override
  State<SwitchWithLable> createState() => _SwitchWithLableState();
}

class _SwitchWithLableState extends State<SwitchWithLable> {

   @override
  void initState() {
     currentValue = widget.value;
    super.initState();

  }

  late bool currentValue;


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            widget.lable,
            style: AppStyles.title.copyWith(fontSize: 14),
            textAlign: TextAlign.start,
          ),
          Spacer(),
          Switch(
              activeColor: AppColors.lightGreen,
              inactiveThumbColor: AppColors.errorRed,
              thumbColor: MaterialStatePropertyAll<Color>(AppColors.white),
              value: currentValue,
              onChanged: (val) {
                setState(() {
                  currentValue = val;
                  widget.onChange(val);
                });
              })
        ],
      ),
    );
  }
}
