import 'dart:developer';

import 'package:event_app/common/utils/palette.dart';
import 'package:event_app/common/utils/typography.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final obsecure = ValueNotifier<bool>(false);

  @override
  Widget build(BuildContext context) {
    log('refresh page');
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: Stack(
          children: [
            Align(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                child: SafeArea(
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Center(
                          child: Image.asset(
                            'assets/logo.png',
                            width: MediaQuery.of(context).size.width / 3,
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        TextField(
                          controller: emailController,
                          style: MyTypography.bodyMedium,
                          decoration: InputDecoration(
                            label: Text(
                              'Email',
                              style: MyTypography.bodyMedium,
                            ),
                            hintText: 'Silahkan tulis email',
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        ValueListenableBuilder(
                          valueListenable: obsecure,
                          builder: (context, _, __) => TextField(
                            controller: passwordController,
                            style: MyTypography.bodyMedium,
                            obscureText: obsecure.value,
                            decoration: InputDecoration(
                              suffixIcon: IconButton(
                                  onPressed: () {
                                    obsecure.value = !obsecure.value;
                                  },
                                  icon: Icon(!obsecure.value
                                      ? Icons.visibility
                                      : Icons.visibility_off)),
                              label: Text(
                                'Password',
                                style: MyTypography.bodyMedium,
                              ),
                              hintText: 'Silahkan tulis password',
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                            onPressed: () {},
                            child: Text(
                              'Forgot password ?',
                              style: MyTypography.bodyMedium
                                  .copyWith(color: Palette.primary),
                            ),
                          ),
                        ),
                        OutlinedButton(
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Palette.primary,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            side: const BorderSide(
                              color: Palette.primary,
                            ),
                            backgroundColor: Colors.white,
                            minimumSize: const Size(
                              double.infinity,
                              50,
                            ),
                          ),
                          onPressed: () {},
                          child: Text(
                            'Login',
                            style: MyTypography.bodyLarge
                                .copyWith(color: Palette.primary),
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Belum Punya Akun ?',
                              style: MyTypography.bodyMedium.copyWith(),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            InkWell(
                              onTap: () {},
                              child: Text(
                                'Daftar Sekarang',
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
            ),
          ],
        ),
      ),
    );
  }
}
