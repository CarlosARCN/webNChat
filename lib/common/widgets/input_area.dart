import 'package:flutter/material.dart';
import 'package:newwhatsup/common/styles/colors.dart';
import 'package:newwhatsup/common/styles/dimensions.dart';
import 'package:newwhatsup/common/styles/typography.dart';

class TextInputArea extends StatefulWidget {
  const TextInputArea({
    Key? key,
    this.hintText,
    this.minLines,
    this.maxLines,
    this.topPadding,
    this.bottomPadding,
    required this.keyBoardType,
    required this.title,
    this.initialValue,
    required this.enableTextLength,
    this.maxLengthSize,
    this.counterText,
    this.textAlign,
  }) : super(key: key);

  final String? hintText;
  final int? minLines;
  final int? maxLines;
  final double? topPadding;
  final double? bottomPadding;
  final TextInputType keyBoardType;
  final String title;
  final String? initialValue;
  final bool enableTextLength;
  final int? maxLengthSize;
  final String? counterText;
  final TextAlign? textAlign;

  @override
  State<TextInputArea> createState() => _TextInputAreadState();
}

class _TextInputAreadState extends State<TextInputArea> {
  double get defaultTopPad => Dimensions.x10;

  String get defaultCounterText => '';

  double get defaultBottPad => Dimensions.x8;

  int get defaultMaxLengthSize => Dimensions.x200.toInt();

  TextAlign get defaultTextAlign => TextAlign.start;

  int textLengthSize = 0;

  @override
  void initState() {
    textLengthSize = widget.initialValue?.length ?? 0;
    super.initState();
  }

  String get size =>
      '${textLengthSize.toString()}/${widget.maxLengthSize?.toString() ?? defaultMaxLengthSize}';

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: EdgeInsets.only(
            top: widget.topPadding ?? defaultTopPad,
            bottom: widget.bottomPadding ?? defaultBottPad,
          ),
          child: Wrap(
            alignment: WrapAlignment.spaceBetween,
            children: [
              Text(
                widget.title,
                style: TextStyles.textSmall.copyWith(
                  fontWeight: FontWeight.w400,
                ),
              ),
              if (widget.enableTextLength) ...[
                Text(
                  size,
                  style: TextStyles.textSmall.copyWith(
                    fontWeight: FontWeight.w400,
                    color: ColorStyles.letterCounter,
                  ),
                )
              ]
            ],
          ),
        ),
        TextFormField(
          textAlign: widget.textAlign ?? defaultTextAlign,
          initialValue: widget.initialValue,
          minLines: widget.minLines,
          maxLines: widget.maxLines,
          decoration: InputDecoration(
            counterText: widget.counterText ?? defaultCounterText,
            hintText: widget.hintText,
            hintStyle: TextStyles.textSmall.copyWith(
              fontWeight: FontWeight.w400,
              color: ColorStyles.secundaryCheckBoxLabel,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(
                Dimensions.x10,
              ),
            ),
          ),
          cursorRadius: const Radius.circular(
            Dimensions.x10,
          ),
          keyboardType: TextInputType.text,
          maxLength: widget.maxLengthSize ?? defaultMaxLengthSize,
          onChanged: (value) {
            setState(() {
              textLengthSize = value.length;
            });
          },
        ),
      ],
    );
  }
}
