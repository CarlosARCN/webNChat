import 'package:flutter/material.dart';
import 'package:newwhatsup/common/styles/colors.dart';

import '../styles/typography.dart';

class SucessAlertWidget extends StatelessWidget {
  const SucessAlertWidget({
    super.key,
    required this.message,
  });

  final String message;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorStyles.alertGreen,
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
