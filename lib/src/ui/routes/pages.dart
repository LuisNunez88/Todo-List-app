import 'package:flutter/material.dart';
import 'package:todo/src/ui/pages/signin/signin_page.dart';
import 'package:todo/src/ui/pages/splash/splash_page.dart';
import 'package:todo/src/ui/pages/todolist/todo_page.dart';

import 'routes.dart';

Map<String, Widget Function(BuildContext)> appRoutes = {
  Routes.SPLASH: (_) => const SplashPage(),
  Routes.LOGIN_PAGE: (_) => const SigninPage(),
  Routes.TODO_PAGE: (_) => const TodoPage(),
};
