import 'package:flutter/material.dart';
import 'package:mnm_internal_admin/core/values/app_colors.dart';
import 'package:mnm_internal_admin/core/values/app_styles.dart';

import '../../../../../core/values/constants.dart';

class ValueChangeWidget extends StatefulWidget {
  const ValueChangeWidget(
      {super.key,
      required this.title,
      required this.changedValue,

      required this.onChange});

  final String title;
  final int changedValue;
  final ValueChanged<int> onChange;

  @override
  State<ValueChangeWidget> createState() => _ValueChangeWidgetState();
}

class _ValueChangeWidgetState extends State<ValueChangeWidget> {

  late int currentValue;


  @override
  void initState() {
    currentValue = widget.changedValue;
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.title,
            style: AppStyles.mediumStyle
                .copyWith(color: AppColors.textDarkGreyColor, fontSize: 12),
          ),
          SizedBox(
            height: 6,
          ),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(r8),
                border: Border.all(color: AppColors.lightGreen)),
            padding: const EdgeInsets.all(8),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                        flex: 2,
                        child: AspectRatio(
                            aspectRatio: 1,
                            child: IncrementButton(
                              onTap: () {
                                setState(() {
                                  currentValue--;
                                  widget.onChange(currentValue);
                                });
                              },
                              icon: Icons.remove,
                            ))),
                    Expanded(
                        flex: 11,
                        child: Column(
                          children: [
                            Text(
                              '${currentValue > 0 ? '+ ' : currentValue < 0  ? '- ': ''}${ currentValue.abs()}',
                              style: AppStyles.title,
                            ),
                          ],
                        )),
                    Expanded(
                        flex: 2,
                        child: AspectRatio(
                            aspectRatio: 1,
                            child: IncrementButton(
                              onTap: () {
                               setState(() {
                                 currentValue++;
                                 widget.onChange(currentValue);
                               });
                              },
                              icon: Icons.add,
                            ))),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class IncrementButton extends StatelessWidget {
  const IncrementButton({super.key, required this.onTap, required this.icon});

  final VoidCallback onTap;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(r6),
            color: AppColors.lightGreen),
        child: FittedBox(
          child: Icon(
            icon,
            color: AppColors.white,
          ),
        ),
      ),
    );
  }
}
