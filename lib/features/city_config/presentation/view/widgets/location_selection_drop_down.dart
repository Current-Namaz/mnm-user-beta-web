import 'package:flutter/material.dart';
import 'package:mnm_internal_admin/core/values/app_colors.dart';
import 'package:mnm_internal_admin/core/values/app_styles.dart';
import 'package:mnm_internal_admin/features/masjids/domain/entities/country.dart';
import 'package:mnm_internal_admin/features/masjids/domain/entities/state.dart';
import 'package:mnm_internal_admin/features/masjids/presentation/view/widgets/masjid_location_item_view.dart';

import '../../../../../core/values/constants.dart';
import '../../../../masjids/domain/entities/city.dart';

class LocationSelectionDropDown<T> extends StatefulWidget {
  const LocationSelectionDropDown(
      {super.key,
      this.selectedValue,
      required this.itemList,
      required this.hintText,
      required this.onItemTap,  this.searchWidget,
  });

  final T? selectedValue;
  final String? hintText;
  final List<T> itemList;
  final Widget? searchWidget;
  final ValueChanged<T> onItemTap;

  @override
  State<LocationSelectionDropDown<T>> createState() =>
      _LocationSelectionDropDownState<T>();
}

class _LocationSelectionDropDownState<T>
    extends State<LocationSelectionDropDown<T>> {
  final OverlayPortalController _tooltipController = OverlayPortalController();

  final _link = LayerLink();
  late double _buttonWidth = 0;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return CompositedTransformTarget(
      link: _link,
      child: OverlayPortal(
        controller: _tooltipController,
        overlayChildBuilder: (BuildContext context) {
          OverlayEntry(
            builder: (context) => SizedBox(
              width: MediaQuery.sizeOf(context).width,
              height: MediaQuery.sizeOf(context).height,
              child: Stack(
                children: [
                  ModalBarrier(
                    onDismiss: () {
                      _tooltipController.toggle();
                    },
                  ),
                  Positioned(
                    width: MediaQuery.sizeOf(context).width,
                    child: CompositedTransformFollower(
                      link: _link,
                      targetAnchor: Alignment.bottomLeft,
                      child: Align(
                        alignment: AlignmentDirectional.topStart,
                        child: Container(
                          width: _buttonWidth,
                          color: Colors.red,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
          return CompositedTransformFollower(
            link: _link,
            targetAnchor: Alignment.bottomLeft,
            child: Align(
              alignment: AlignmentDirectional.topStart,
              child: Container(
                margin: EdgeInsets.only(top: 10),
                padding: EdgeInsets.symmetric(vertical: 5,horizontal: 6),
                width: _buttonWidth,
                constraints: BoxConstraints(
                  maxWidth: _buttonWidth,
                  maxHeight: 350,
                ),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(r8),
                    color: AppColors.darkBlackColor),
                child: Column(
                  children: [
                    if(widget.searchWidget != null )widget.searchWidget!,
                    Expanded(
                      child: ListView.builder(

                        itemCount: widget.itemList.length,
                          itemBuilder: (context,index){
                            return MasjidLocationItemView<T>(
                                isSelected: false,
                                entity:  widget.itemList[index],
                                onTap: () {
                                  widget.onItemTap( widget.itemList[index]);
                                  _tooltipController.hide();
                                },
                                onDoubleTap: () {});
                          },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
        child: GestureDetector(
          onTap: () {
            if(widget.itemList.isNotEmpty) {
              _buttonWidth = context.size!.width;
              _tooltipController.toggle();
            }
          },
          child: AnimatedContainer(
            duration: Duration(milliseconds: 400),
            height: 40,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(r8),
                color: Color(0x806c757d)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    children: [
                      Expanded(
                        child: Align(
                          alignment: FractionalOffset.centerLeft,
                          child: Text(
                            '${widget.selectedValue != null ? ((T == CountryEntity) ? (widget.selectedValue as CountryEntity).name : (T == StateEntity) ? (widget.selectedValue as StateEntity).name : (T == CityEntity) ? (widget.selectedValue as CityEntity).name : 'Invalid value') : widget.hintText}',
                            overflow: TextOverflow.ellipsis,
                            style: AppStyles.smallStyle
                                .copyWith(color: widget.selectedValue == null ? Colors.white24 : AppColors.white),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Icon(
                          Icons.expand_circle_down_rounded,
                          color: widget.itemList.isEmpty
                              ? Colors.white10
                              : AppColors.textPrimaryColor,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
