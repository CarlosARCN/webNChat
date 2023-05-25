import 'package:flutter/material.dart';
import 'package:newwhatsup/pages/Login/mobile/mobile_login_view.dart';
import 'package:newwhatsup/pages/Login/web/web_login_view.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return screenWidth <= 1000 ? const MobileLoginView() : const WebLoginView();
  }
}
