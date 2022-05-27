import 'package:flutter/material.dart';

class AutoHideKeyboard extends StatelessWidget {
  final Widget child;
  const AutoHideKeyboard({Key key, @required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      behavior: HitTestBehavior.opaque,
      child: child,
    );
  }
}
