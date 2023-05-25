import 'package:flutter/material.dart';
import 'package:newwhatsup/common/styles/colors.dart';
import 'package:newwhatsup/common/styles/dimensions.dart';
import 'package:newwhatsup/common/styles/typography.dart';
import 'package:newwhatsup/common/widgets/buttons.dart';
import 'package:newwhatsup/common/widgets/screen.dart';
import 'package:newwhatsup/common/widgets/text_input.dart';

class WebLoginView extends StatefulWidget {
  const WebLoginView({super.key});

  @override
  State<WebLoginView> createState() => _WebLoginViewState();
}

class _WebLoginViewState extends State<WebLoginView> {
  final TextEditingController _controllerNome = TextEditingController();
  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();
  final TextEditingController _controllerRePassword = TextEditingController();
  bool _userRegistration = false;
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Screen(
      wasAppBar: false,
      body: Container(
        width: screenWidth,
        height: screenHeight,
        color: ColorStyles.baseBackground,
        child: Stack(
          children: [
            Positioned(
              child: Container(
                decoration: const BoxDecoration(
                  color: ColorStyles.tiffanyBlue,
                  border: Border(
                    bottom: BorderSide(
                      color: ColorStyles.middleOcenBlueGreen,
                      width: 1.5,
                    ),
                  ),
                ),
                width: screenWidth,
                height: screenHeight <= 666.67 ? 300 : screenHeight * 0.45,
              ),
            ),
            Center(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          top: Dimensions.x20, bottom: Dimensions.x40),
                      child: Column(
                        children: [
                          Card(
                            elevation: Dimensions.x4,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(Dimensions.x16),
                              ),
                            ),
                            child: Container(
                              padding: const EdgeInsets.all(Dimensions.x4),
                              width:
                                  screenWidth <= 1000 ? 400 : screenWidth * 0.4,
                              height: screenHeight <= 1000
                                  ? 100
                                  : screenHeight * 0.1,
                              child: Center(
                                child: Text(
                                  'webNChat',
                                  style: TextStyles.displayHuge.copyWith(
                                      color: ColorStyles.middleOcenBlueGreen,
                                      fontWeight: FontWeight.w600,
                                      letterSpacing: Dimensions.x1),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.all(Dimensions.x16),
                        child: Card(
                          elevation: Dimensions.x4,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(Dimensions.x16),
                            ),
                          ),
                          child: Container(
                            padding: const EdgeInsets.all(Dimensions.x40),
                            width: _userRegistration == true
                                ? screenWidth <= 1000
                                    ? 800
                                    : screenWidth * 0.8
                                : screenWidth <= 1000
                                    ? 400
                                    : screenWidth * 0.4,
                            height: _userRegistration == true
                                ? screenHeight <= 1000
                                    ? 400
                                    : screenHeight * 0.4
                                : screenHeight <= 1000
                                    ? 300
                                    : screenHeight * 0.3,
                            child: Center(
                              child: Wrap(
                                crossAxisAlignment: WrapCrossAlignment.center,
                                alignment: WrapAlignment.spaceEvenly,
                                children: [
                                  SizedBox(
                                    width: screenWidth * 0.4,
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Visibility(
                                          visible: _userRegistration,
                                          child: TextInput(
                                            hintText: "Name",
                                            controller: _controllerNome,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: Dimensions.x10,
                                        ),
                                        TextInput(
                                          hintText: "Email",
                                          controller: _controllerEmail,
                                        ),
                                        const SizedBox(
                                          height: Dimensions.x10,
                                        ),
                                        TextInput(
                                          hintText: "Password",
                                          isObscure: true,
                                          controller: _controllerPassword,
                                        ),
                                        const SizedBox(
                                          height: Dimensions.x10,
                                        ),
                                        Visibility(
                                          visible: _userRegistration,
                                          child: TextInput(
                                            hintText: "Repeat your password",
                                            isObscure: true,
                                            controller: _controllerRePassword,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: Dimensions.x30,
                                        ),
                                        Button(
                                          backgroundColor:
                                              ColorStyles.tiffanyBlue,
                                          onTap: () {},
                                          child: Text(
                                            _userRegistration == true
                                                ? 'Create Account'
                                                : 'login',
                                            style:
                                                TextStyles.textLarge.copyWith(
                                              fontWeight: FontWeight.w700,
                                              color: ColorStyles
                                                  .middleOcenBlueGreen,
                                            ),
                                          ),
                                        ),
                                        Row(
                                          children: [
                                            const Text('login'),
                                            const SizedBox(
                                              width: Dimensions.x10,
                                            ),
                                            Switch.adaptive(
                                              value: _userRegistration,
                                              onChanged: (bool valor) {
                                                setState(
                                                  () {
                                                    _userRegistration = valor;
                                                  },
                                                );
                                              },
                                            ),
                                            const SizedBox(
                                              width: Dimensions.x10,
                                            ),
                                            const Text('Cadastro')
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                  Visibility(
                                    visible: _userRegistration,
                                    child: const SizedBox(
                                      width: Dimensions.x40,
                                    ),
                                  ),
                                  Visibility(
                                    visible: _userRegistration,
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                        bottom: Dimensions.x40,
                                      ),
                                      child: SizedBox(
                                        width: Dimensions.x200,
                                        height: Dimensions.x200,
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(
                                              Dimensions.x50),
                                          child: Image.asset(
                                              'assets/images/userImage.jpeg'),
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
