import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:todo/helpers/responsive.dart';
import 'package:todo/src/ui/global_widgets/autohide_keyboard.dart';
import 'package:todo/src/ui/global_widgets/loading_widget.dart';
import 'package:todo/src/ui/global_widgets/password_form_field.dart';
import 'package:todo/src/ui/routes/routes.dart';

import 'cubit/signin_cubit.dart';

class SigninPage extends StatelessWidget {
  const SigninPage({Key key}) : super(key: key);
  static final GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SigninCubit(),
      child: Builder(builder: (context) {
        return Stack(
          children: [
            Scaffold(
              body: AutoHideKeyboard(
                child: SafeArea(
                  child: SingleChildScrollView(
                    child: Container(
                      height: context.height - context.padding.top,
                      width: context.width,
                      color: Colors.transparent,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            flex: 2,
                            child: Container(
                              width: context.wp(90) > context.hp(60)
                                  ? context.hp(60)
                                  : context.wp(90),
                              child: SvgPicture.asset(
                                'assets/images/logo.svg',
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Expanded(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: 50,
                                ),
                                Text(
                                  "Welcome",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 3,
                            child: Form(
                              key: formKey,
                              child: ConstrainedBox(
                                constraints: BoxConstraints(maxWidth: 280),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    TextFormField(
                                      autocorrect: false,
                                      enableSuggestions: false,
                                      keyboardType: TextInputType.text,
                                      textInputAction: TextInputAction.next,
                                      decoration: InputDecoration(
                                        prefixIcon: Icon(Icons.person),
                                        labelText: 'Username',
                                        hintText: 'Enter the username',
                                      ),
                                      validator: (value) {
                                        if (value == null ||
                                            (value != null &&
                                                value.trim().length == 0)) {
                                          return 'Invalid username';
                                        }
                                        return null;
                                      },
                                      onSaved: context
                                          .read<SigninCubit>()
                                          .setUsername,
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    PasswordFormField(
                                      prefixIcon: Icon(Icons.lock),
                                      validator: (value) {
                                        if (value == null ||
                                            (value != null &&
                                                value.trim().length == 0)) {
                                          return 'Invalid password';
                                        }
                                        return null;
                                      },
                                      onSaved: context
                                          .read<SigninCubit>()
                                          .setPassword,
                                    ),
                                    SizedBox(
                                      height: context.hp(10),
                                    ),
                                    ElevatedButton(
                                      onPressed: () async {
                                        if (formKey.currentState.validate()) {
                                          formKey.currentState.save();
                                          final isLogedIn = await context
                                              .read<SigninCubit>()
                                              .login();
                                          if (isLogedIn != null) {
                                            Navigator.of(context)
                                                .pushNamedAndRemoveUntil(
                                                    Routes.TODO_PAGE,
                                                    (route) => false);
                                          } else {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(SnackBar(
                                              backgroundColor: Colors.red,
                                              content: const Text(
                                                  'User or password invalid!'),
                                            ));
                                          }
                                        }
                                      },
                                      child: Text('Sign In'),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            BlocBuilder<SigninCubit, SigninState>(
              buildWhen: (previous, current) =>
                  previous.isLoading != current.isLoading,
              builder: (context, state) {
                return LoadingWiget(
                  show: state.isLoading,
                );
              },
            )
          ],
        );
      }),
    );
  }
}
