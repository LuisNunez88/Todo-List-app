import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:todo/helpers/responsive.dart';
import 'package:todo/src/ui/routes/routes.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    goLogin();
    super.initState();
  }

  Future<void> goLogin() async {
    await Future.delayed(Duration(seconds: 2));
    Navigator.pushReplacementNamed(context, Routes.LOGIN_PAGE);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: context.wp(90) > context.hp(60)
                ? context.hp(60)
                : context.wp(90),
            child: SvgPicture.asset(
              'assets/images/logo.svg',
              fit: BoxFit.contain,
            ),
          ),
          SizedBox(height: 30.0),
          CircularProgressIndicator(),
        ],
      ),
    );
  }
}
