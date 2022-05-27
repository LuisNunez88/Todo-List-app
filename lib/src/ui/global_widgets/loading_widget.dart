import 'package:flutter/material.dart';

class LoadingWiget extends StatelessWidget {
  final bool show;
  const LoadingWiget({Key key, this.show = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 200),
      child: show
          ? Container(
              width: double.infinity,
              height: double.infinity,
              color: Colors.black38,
              child: Center(
                child: CircularProgressIndicator(),
              ),
            )
          : null,
    );
  }
}
