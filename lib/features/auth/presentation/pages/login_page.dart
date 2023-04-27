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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
        ),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Image.asset(
                  'assets/logo.png',
                  width: 100,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              TextField(
                controller: emailController,
                style: MyTypography.body,
                decoration: InputDecoration(
                  label: Text(
                    'Email',
                    style: MyTypography.body,
                  ),
                  hintText: 'Silahkan tulis email',
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                      color: Palette.grey,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                      color: Palette.grey,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                controller: passwordController,
                style: MyTypography.body,
                obscureText: true,
                decoration: InputDecoration(
                  label: Text(
                    'Password',
                    style: MyTypography.body,
                  ),
                  hintText: 'Silahkan tulis password',
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                      color: Palette.grey,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                      color: Palette.grey,
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    'Forgot password ?',
                    style: MyTypography.title.copyWith(color: Palette.primary),
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
                  style: MyTypography.title.copyWith(color: Palette.primary),
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
                    style: MyTypography.title.copyWith(),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  InkWell(
                    onTap: () {},
                    child: Text(
                      'Daftar Sekarang',
                      style:
                          MyTypography.title.copyWith(color: Palette.primary),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
