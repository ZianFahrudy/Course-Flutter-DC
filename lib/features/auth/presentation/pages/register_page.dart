import 'package:event_app/common/utils/palette.dart';
import 'package:event_app/common/utils/typography.dart';
import 'package:event_app/components/button/my_outlined_button.dart';
import 'package:event_app/components/empty/nothing.dart';
import 'package:event_app/components/flushbar/my_flushbar.dart';
import 'package:event_app/components/loader/page_loader.dart';
import 'package:event_app/components/textfield/my_textfield.dart';
import 'package:event_app/core/di/injection.dart';
import 'package:event_app/core/routes/routes.dart';
import 'package:event_app/features/auth/data/models/request/register_body.dart';
import 'package:event_app/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:event_app/features/auth/presentation/widgets/login_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final emailController = TextEditingController();
  final nameController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  final obsecure = ValueNotifier<bool>(true);
  final confirmObsecure = ValueNotifier<bool>(true);

  final authBloc = sl<AuthBloc>();

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

  void onRegisterPressed() {
    if (isValidated()) {
      authBloc.add(
        RegisterEvent(
          body: RegisterBody(
            memberName: nameController.text,
            memberEmail: emailController.text,
            memberPassword: passwordController.text,
            memberConfPassword: confirmPasswordController.text,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => authBloc,
      child: Scaffold(
        body: BlocConsumer<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is RegisterSuccess) {
              Get.offAllNamed<void>(RoutesName.registerSuccessPage);
            } else if (state is AuthFailure) {
              MyFlushbar.failure(context, state.message);
            }
          },
          builder: (context, state) {
            return GestureDetector(
              onTap: () => FocusScope.of(context).unfocus(),
              child: Stack(
                children: [
                  _registerContent(),
                  _stateRegisterLoading(),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  BlocBuilder<AuthBloc, AuthState> _stateRegisterLoading() {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        if (state is AuthLoading) {
          return const PageLoader();
        } else {
          return const Nothing();
        }
      },
    );
  }

  Align _registerContent() {
    return Align(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const LoginImage(),
                RegisterFormField(
                  formKey: _formKey,
                  nameController: nameController,
                  emailController: emailController,
                  obsecure: obsecure,
                  passwordController: passwordController,
                  confirmObsecure: confirmObsecure,
                  confirmPasswordController: confirmPasswordController,
                ),
                MyOutlinedButton(
                  text: 'Daftar',
                  onPressed: onRegisterPressed,
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Sudah Punya Akun ?',
                      style: MyTypography.bodyMedium.copyWith(),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    InkWell(
                      onTap: () {
                        Get.toNamed<void>(RoutesName.loginPage);
                      },
                      child: Text(
                        'Login Sekarang',
                        style: MyTypography.bodyMedium
                            .copyWith(color: Palette.primary),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class RegisterFormField extends StatelessWidget {
  const RegisterFormField({
    required GlobalKey<FormState> formKey,
    required this.nameController,
    required this.emailController,
    required this.obsecure,
    required this.passwordController,
    required this.confirmObsecure,
    required this.confirmPasswordController,
    super.key,
  }) : _formKey = formKey;

  final GlobalKey<FormState> _formKey;
  final TextEditingController nameController;
  final TextEditingController emailController;
  final ValueNotifier<bool> obsecure;
  final TextEditingController passwordController;
  final ValueNotifier<bool> confirmObsecure;
  final TextEditingController confirmPasswordController;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          MyTextField(
            controller: nameController,
            validator: FormBuilderValidators.compose([
              FormBuilderValidators.required(),
            ]),
            label: 'Nama Lengkap',
            hintText: 'Silahkan tulis nama lengkap',
          ),
          const SizedBox(
            height: 20,
          ),
          MyTextField(
            controller: emailController,
            validator: FormBuilderValidators.compose([
              FormBuilderValidators.required(),
              FormBuilderValidators.email(),
            ]),
            label: 'Email',
            hintText: 'Silahkan tulis email',
          ),
          const SizedBox(
            height: 20,
          ),
          ValueListenableBuilder(
            valueListenable: obsecure,
            builder: (context, _, __) => MyTextField(
              label: 'Password',
              hintText: 'Silahkan tulis password',
              obscureText: obsecure.value,
              validator: FormBuilderValidators.required(),
              controller: passwordController,
              suffixIcon: IconButton(
                onPressed: () {
                  obsecure.value = !obsecure.value;
                },
                icon: Icon(
                  !obsecure.value ? Icons.visibility : Icons.visibility_off,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          ValueListenableBuilder(
            valueListenable: confirmObsecure,
            builder: (context, _, __) => MyTextField(
              label: 'Confirm Password',
              hintText: 'Silahkan tulis confirm password',
              obscureText: confirmObsecure.value,
              validator: FormBuilderValidators.required(),
              controller: confirmPasswordController,
              suffixIcon: IconButton(
                onPressed: () {
                  confirmObsecure.value = !confirmObsecure.value;
                },
                icon: Icon(
                  !confirmObsecure.value
                      ? Icons.visibility
                      : Icons.visibility_off,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
        ],
      ),
    );
  }
}
