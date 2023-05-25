import 'package:flutter/material.dart';
import 'package:newwhatsup/common/styles/colors.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Error',
        style: TextStyle(color: ColorStyles.alertRed),
      ),
    );
  }
}
