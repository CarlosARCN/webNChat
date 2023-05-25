// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:newwhatsup/common/widgets/buttons.dart';

import '../styles/dimensions.dart';

class Screen extends StatelessWidget {
  const Screen({
    Key? key,
    this.body,
    this.wasAppBar,
    this.endDrawer,
    this.appBar,
    this.bottomButtons,
    this.floatingActionButton,
  }) : super(key: key);

  final Widget? body;
  final bool? wasAppBar;
  final Widget? endDrawer;
  final AppBar? appBar;
  final List<Widget>? bottomButtons;
  final Widget? floatingActionButton;

  AppBar get defaultAppBar => AppBar(
        title: const Text('Screen'),
      );

  Widget get defaultButton => Button(
        label: 'Press Me',
        onTap: () {},
      );

  Widget buttonContainer(Widget child) => Flexible(
        flex: 1,
        child: Padding(
          padding: const EdgeInsets.all(
            Dimensions.x8,
          ),
          child: SizedBox(
            width: double.infinity,
            child: child,
          ),
        ),
      );

  bool get defaultWasAppBar => true;

  Widget get empty => const Center(
        child: Text('Nothing here'),
      );

  List<Widget>? generateButtons() {
    return bottomButtons != null
        ? [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: bottomButtons!
                  .map((button) => buttonContainer(button))
                  .toList(),
            )
          ]
        : null;
  }

  @override
  Widget build(BuildContext context) {
    final bool defaultWasAppBar = wasAppBar ?? true;
    final PreferredSizeWidget appbras = appBar ?? defaultAppBar;

    return Scaffold(
      endDrawer: endDrawer,
      appBar: defaultWasAppBar == true ? appbras : null,
      body: body ?? empty,
      persistentFooterAlignment: AlignmentDirectional.center,
      persistentFooterButtons: generateButtons(),
      floatingActionButton: floatingActionButton,
    );
  }
}
