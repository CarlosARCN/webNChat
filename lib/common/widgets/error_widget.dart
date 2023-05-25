import 'package:flutter/material.dart';
import 'package:newwhatsup/common/styles/colors.dart';
import 'package:newwhatsup/common/styles/typography.dart';

class ErrorAlertWidget extends StatelessWidget {
  const ErrorAlertWidget({
    super.key,
    required this.message,
  });

  final String message;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorStyles.red,
      child: Center(
        child: Text(
          message,
          style: TextStyles.textMedium.copyWith(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
