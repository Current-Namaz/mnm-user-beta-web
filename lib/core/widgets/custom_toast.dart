import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mnm_internal_admin/core/values/app_colors.dart';
import 'package:mnm_internal_admin/core/values/app_images.dart';
import 'package:mnm_internal_admin/core/values/app_styles.dart';
import 'package:mnm_internal_admin/core/widgets/common_image.dart';

import '../values/constants.dart';

enum StatusType { success, error, warning }

class CustomToast extends StatefulWidget {
  CustomToast({super.key,required this.title,required this.description});




  StatusType statusType = StatusType.success;
  final String title;
  final String description;

  OverlayEntry? overlayEntry;

  void show(BuildContext context) {
    overlayEntry = _overlayEntryBuilder();
    Overlay.maybeOf(context)?.insert(overlayEntry!);
    Future.delayed(const Duration(seconds: 3)).then((value) => closeOverlay());
  }

  void closeOverlay() {
    overlayEntry?.remove();
    overlayEntry = null;
  }

  OverlayEntry _overlayEntryBuilder() {
    return OverlayEntry(
      opaque: false,
      builder: (context) {
        return Dialog(
          alignment: Alignment.bottomRight,
          backgroundColor: Colors.transparent,
          insetPadding: const EdgeInsets.all(30),
          elevation: 0,
          child: this,
        );
      },
    );
  }

  CustomToast.success({super.key,required this.title,required this.description}) {
    statusType = StatusType.success;
  }

  CustomToast.error({super.key,required this.title,required this.description}) {
    statusType = StatusType.error;
  }

  CustomToast.warning({super.key,required this.title,required this.description}) {
    statusType = StatusType.warning;
  }

  @override
  State<CustomToast> createState() => _CustomToastState();
}

class _CustomToastState extends State<CustomToast> with SingleTickerProviderStateMixin{

  late Timer closeTimer;
  late Animation<Offset> offsetAnimation;
  late AnimationController slideController;


  @override
  void initState() {
    void _initializeAnimation() {
      slideController = AnimationController(
        duration: Duration(milliseconds: 2500),
        vsync: this,
      );

      offsetAnimation = Tween<Offset>(
        begin: const Offset(2, 0),
        end: const Offset(0, 0),
      ).animate(
        CurvedAnimation(
          parent: slideController,
          curve: Curves.ease,
        ),
      );

      T? ambiguate<T>(T? value) => value;

      ambiguate(WidgetsBinding.instance)?.addPostFrameCallback(
            (_) => slideController.forward(),
      );
      super.initState();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20, right: 0),
      padding: const EdgeInsets.only(left: 5),
      decoration: BoxDecoration(
        color: widget.statusType == StatusType.success
            ? AppColors.successGreen
            : widget.statusType == StatusType.error
                ? AppColors.errorRed
                : AppColors.warningYellow,
        borderRadius: BorderRadius.circular(r8),
      ),
      child: Container(
        padding: const EdgeInsets.only(top: 12, bottom: 12, right: 25),
        decoration: BoxDecoration(
            color: AppColors.white, borderRadius: BorderRadius.circular(r8)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(
                  width: 20,
                ),
                SizedBox(
                  height: 30,
                  width: 30,
                  child: CommonImage.asset(widget.statusType == StatusType.success
                      ? AppImages.success
                      : widget.statusType == StatusType.error
                      ? AppImages.error
                      : AppImages.warning),
                ),
                const SizedBox(
                  width: 20,
                ),
                SizedBox(
                  // width: 160,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.title,
                        style: AppStyles.mediumStyle
                            .copyWith(color: AppColors.primaryColor),
                      ),
                      const SizedBox(
                        height: 2,
                      ),
                      Text(
                        widget.description,
                        style: AppStyles.smallStyle.copyWith(
                            color: AppColors.primaryColor, fontSize: 12),
                      )
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
