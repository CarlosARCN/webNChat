import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:newwhatsup/common/styles/colors.dart';
import 'package:newwhatsup/common/styles/dimensions.dart';
import 'package:newwhatsup/common/styles/icons.dart';
import 'package:newwhatsup/common/styles/typography.dart';

class TextInput extends StatelessWidget {
  const TextInput({
    Key? key,
    this.title,
    this.description,
    this.labelDescription,
    this.titleStyle,
    this.hintText,
    this.initialValue,
    this.hintStyle,
    this.labelDescriptionStyle,
    this.inputType,
    this.descriptionIcon,
    this.suffixIcon,
    this.suffixConstraints,
    this.preffixIcon,
    this.preffixConstraints,
    this.isObscure,
    this.controller,
    this.onValidate,
    this.textStyle,
    this.isReadOnly,
    this.focusNode,
  }) : super(key: key);

  final String? title;
  final String? description;
  final String? labelDescription;
  final TextStyle? titleStyle;
  final String? hintText;
  final String? initialValue;
  final TextStyle? hintStyle;
  final TextStyle? labelDescriptionStyle;
  final TextInputType? inputType;
  final SvgPicture? descriptionIcon;
  final Widget? suffixIcon;
  final BoxConstraints? suffixConstraints;
  final Widget? preffixIcon;
  final BoxConstraints? preffixConstraints;
  final bool? isObscure;
  final bool? isReadOnly;
  final FocusNode? focusNode;
  final TextEditingController? controller;
  final String? Function(String? text)? onValidate;
  final TextStyle? textStyle;

  TextStyle get defaultTextStyle => TextStyles.textSmall.copyWith(
        fontWeight: FontWeight.w400,
        color: ColorStyles.secundaryCheckBoxLabel,
      );

  TextInputType get defaultInputType => TextInputType.text;

  TextStyle get defaultTitleStyle =>
      TextStyles.textSmall.copyWith(fontWeight: FontWeight.w400);

  SvgPicture get defaultDescriptionIcon => legalOrPhysicalPersonIcon;

  TextStyle get defaultLabelDescriptionStyle => TextStyles.textTiny.copyWith(
      fontWeight: FontWeight.w400, color: ColorStyles.empytContactsViewText);

  BoxConstraints get defaultSuffixContraints => const BoxConstraints(
        minHeight: Dimensions.x10,
        minWidth: Dimensions.x10,
      );
  BoxConstraints get defaultPreffixContraints => const BoxConstraints(
        minHeight: Dimensions.x16,
        minWidth: Dimensions.x16,
      );
  bool get defaultIsObscureText => false;
  bool get defaultIsReadOnly => false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title != null) ...[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title ?? '',
                style: titleStyle ?? defaultTitleStyle,
              ),
              Text(
                description ?? '',
                style: titleStyle ?? defaultTitleStyle,
              ),
            ],
          ),
          const SizedBox(
            height: Dimensions.x8,
          )
        ],
        TextFormField(
          readOnly: isReadOnly ?? defaultIsReadOnly,
          focusNode: focusNode,
          validator: onValidate,
          controller: controller,
          initialValue: initialValue,
          obscureText: isObscure ?? defaultIsObscureText,
          decoration: InputDecoration(
            suffixIcon: suffixIcon,
            prefixIcon: preffixIcon,
            prefixIconConstraints:
                preffixConstraints ?? defaultPreffixContraints,
            suffixIconConstraints: suffixConstraints ?? defaultSuffixContraints,
            hintText: hintText,
            hintStyle: hintStyle ?? defaultTextStyle,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(
              Dimensions.x10,
            )),
            contentPadding: const EdgeInsets.all(
              Dimensions.x14,
            ),
          ),
          cursorRadius: const Radius.circular(
            Dimensions.x10,
          ),
          keyboardType: inputType ?? defaultInputType,
          style: textStyle,
        ),
        if (labelDescription != null) ...[
          const SizedBox(
            height: Dimensions.x8,
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: Dimensions.x8),
                child: Container(
                  constraints: const BoxConstraints(
                    maxHeight: Dimensions.x12,
                    maxWidth: Dimensions.x12,
                  ),
                  child: descriptionIcon ?? defaultDescriptionIcon,
                ),
              ),
              Text(
                labelDescription ?? '',
                style: labelDescriptionStyle ?? defaultLabelDescriptionStyle,
              ),
            ],
          ),
        ]
      ],
    );
  }
}
