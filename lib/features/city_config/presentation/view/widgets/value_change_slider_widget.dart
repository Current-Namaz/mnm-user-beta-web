import 'package:flutter/material.dart';
import 'package:mnm_internal_admin/core/values/app_colors.dart';
import 'package:mnm_internal_admin/core/values/app_styles.dart';

import '../../../../../core/values/constants.dart';

class ValueChangeSliderWidget extends StatefulWidget {
  const ValueChangeSliderWidget(
      {super.key,
      required this.title,
      required this.value,
      required this.onChange,
      required this.minValue,
      required this.maxValue});

  final String title;
  final int value;
  final int minValue;
  final int maxValue;
  final ValueChanged<int> onChange;

  @override
  State<ValueChangeSliderWidget> createState() =>
      _ValueChangeSliderWidgetState();
}

class _ValueChangeSliderWidgetState extends State<ValueChangeSliderWidget> {
  late int currentValue;

  @override
  void initState() {
    currentValue = widget.value;
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
          SizedBox(height: 6),
          Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(r8),
                  border: Border.all(color: AppColors.lightGreen)),
              padding: const EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    widget.minValue.toString(),
                    style: AppStyles.mediumStyle.copyWith(
                        color: AppColors.textDarkGreyColor, fontSize: 12),
                  ),
                  SliderTheme(
                    data: SliderThemeData(
                        activeTrackColor: AppColors.lightGreen,
                        thumbColor: AppColors.lightGreen,
                        thumbShape: CustomSliderThumbCircle(
                            thumbRadius: 15,
                            max: widget.maxValue,
                            min: widget.minValue),
                        showValueIndicator: ShowValueIndicator.never),
                    child: Slider(
                        min: widget.minValue.toDouble(),
                        max: widget.maxValue.toDouble(),
                        value: currentValue.toDouble(),
                        onChanged: (val) {
                          setState(() {
                            currentValue = val.toInt();
                            widget.onChange(val.toInt());
                          });
                        }),
                  ),
                  Text(
                    widget.maxValue.toString(),
                    style: AppStyles.mediumStyle.copyWith(
                        color: AppColors.textDarkGreyColor, fontSize: 12),
                  ),
                ],
              )),
        ],
      ),
    );
  }
}

class CustomSliderThumbCircle extends SliderComponentShape {
  final double thumbRadius;
  final int min;
  final int max;

  const CustomSliderThumbCircle({
    required this.thumbRadius,
    this.min = 0,
    this.max = 10,
  });

  @override
  Size getPreferredSize(bool isEnabled, bool isDiscrete) {
    return Size.fromRadius(thumbRadius);
  }

  @override
  void paint(
    PaintingContext context,
    Offset center, {
    Animation<double>? activationAnimation,
    Animation<double>? enableAnimation,
    bool? isDiscrete,
    TextPainter? labelPainter,
    RenderBox? parentBox,
    SliderThemeData? sliderTheme,
    TextDirection? textDirection,
    double? value,
    double? textScaleFactor,
    Size? sizeWithOverflow,
  }) {
    final Canvas canvas = context.canvas;

    final paint = Paint()
      ..color = sliderTheme!.thumbColor! //Thumb Background Color
      ..style = PaintingStyle.fill;

    TextSpan span = TextSpan(
      style:    AppStyles.mediumStyle.copyWith(
        color: AppColors.white,
        fontSize: thumbRadius * .8,
      ),
      text: getValue(value!),
    );

    TextPainter tp = new TextPainter(
        text: span,
        textAlign: TextAlign.center,
        textDirection: TextDirection.ltr);
    tp.layout();
    Offset textCenter =
        Offset(center.dx - (tp.width / 2), center.dy - (tp.height / 2));

    canvas.drawCircle(center, thumbRadius * .9, paint);
    tp.paint(canvas, textCenter);
  }

  String getValue(double value) {
    return (min + (max - min) * value).round().toString();
  }
}
