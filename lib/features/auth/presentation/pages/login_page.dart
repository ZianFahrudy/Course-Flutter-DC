// ignore_for_file: inference_failure_on_instance_creation

import 'package:event_app/components/empty/nothing.dart';
import 'package:event_app/components/flushbar/my_flushbar.dart';
import 'package:event_app/components/loader/page_loader.dart';
import 'package:event_app/core/di/injection.dart';
import 'package:event_app/core/routes/routes.dart';
import 'package:event_app/features/auth/data/models/request/login_body.dart';
import 'package:event_app/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:event_app/features/auth/presentation/widgets/login_bottom_bar.dart';
import 'package:event_app/features/auth/presentation/widgets/login_form.dart';
import 'package:event_app/features/auth/presentation/widgets/login_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final authBloc = sl<AuthBloc>();

  final obsecure = ValueNotifier<bool>(true);

  final _formKey = GlobalKey<FormState>();

  bool isValidated() {
    final form = _formKey.currentState;

    if (form!.validate()) {
      form.save();

      return true;
    } else {
      return false;
    }
  }

  void onLoginPressed() {
    if (isValidated()) {
      authBloc.add(
        LoginEvent(
          body: LoginBody(
            email: emailController.text,
            password: passwordController.text,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => authBloc,
      child: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthSuccess) {
            Get.offNamed<void>(RoutesName.mainNavigation);
          } else if (state is AuthFailure) {
            MyFlushbar.failure(context, state.message);
          }
        },
        builder: (context, state) {
          return GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: Scaffold(
              body: Stack(
                children: [
                  LoginContent(
                    formKey: _formKey,
                    emailController: emailController,
                    obsecure: obsecure,
                    passwordController: passwordController,
                    onPressed: onLoginPressed,
                  ),
                  BlocBuilder<AuthBloc, AuthState>(
                    builder: (context, state) {
                      if (state is AuthLoading) {
                        return const PageLoader();
                      } else {
                        return const Nothing();
                      }
                    },
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class LoginContent extends StatelessWidget {
  const LoginContent({
    required this.formKey,
    required this.emailController,
    required this.obsecure,
    required this.passwordController,
    super.key,
    this.onPressed,
  });

  final GlobalKey<FormState> formKey;
  final TextEditingController emailController;
  final ValueNotifier<bool> obsecure;
  final TextEditingController passwordController;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Align(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {},
                  child: const LoginImage(),
                ),
                LoginForm(
                  formKey: formKey,
                  emailController: emailController,
                  obsecure: obsecure,
                  passwordController: passwordController,
                ),
                LoginBottomBar(
                  onPressed: onPressed,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
