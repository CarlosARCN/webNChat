import 'package:flutter/material.dart';
import 'package:newwhatsup/common/styles/colors.dart';
import 'package:newwhatsup/common/styles/dimensions.dart';
import 'package:newwhatsup/common/styles/typography.dart';

class Button extends StatelessWidget {
  const Button({
    Key? key,
    this.label,
    this.width,
    this.height,
    this.backgroundColor,
    this.child,
    required this.onTap,
    this.elevation,
    this.borderSideType,
    this.isLoading = false,
  })  : assert(label != null && child == null || child != null && label == null,
            'You cannot pass label and child, choose one'),
        super(key: key);

  final String? label;
  final double? width;
  final double? height;
  final Color? backgroundColor;
  final Widget? child;
  final VoidCallback? onTap;
  final double? elevation;
  final BorderSide? borderSideType;
  final bool isLoading;

  Widget get defaultChild => Container(
        key: const Key('defaultbuttonChild'),
        child: Text(
          label ?? '',
          style: TextStyles.textMedium.copyWith(
            fontWeight: FontWeight.w400,
            color: ColorStyles.baseBody,
          ),
        ),
      );

  Widget get loadingWidget => Center(
        key: const Key('loadingButtonWidget'),
        child: CircularProgressIndicator(
          color: backgroundColor == null
              ? ColorStyles.baseBody
              : ColorStyles.alertBlue,
        ),
      );

  Color get defaultColor => ColorStyles.alertBlue;
  double get defaultWidth => Dimensions.zero;
  double get defaultHeight => Dimensions.x48;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        elevation: elevation,
        backgroundColor: backgroundColor ?? defaultColor,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
          Dimensions.x8,
        )),
        side: borderSideType,
        minimumSize: Size(
          width ?? defaultWidth,
          height ?? defaultHeight,
        ),
      ),
      onPressed: onTap,
      child: isLoading == true ? loadingWidget : child ?? defaultChild,
    );
  }
}
