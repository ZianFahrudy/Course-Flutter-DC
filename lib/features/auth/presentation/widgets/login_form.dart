import 'package:event_app/components/textfield/my_textfield.dart';
import 'package:flutter/material.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    required GlobalKey<FormState> formKey,
    required this.emailController,
    required this.obsecure,
    required this.passwordController,
    super.key,
  }) : _formKey = formKey;

  final GlobalKey<FormState> _formKey;
  final TextEditingController emailController;
  final ValueNotifier<bool> obsecure;
  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
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
        ],
      ),
    );
  }
}
