import 'package:event_app/common/utils/palette.dart';
import 'package:event_app/common/utils/typography.dart';
import 'package:event_app/core/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterSuccessPage extends StatelessWidget {
  const RegisterSuccessPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // image
            Center(
              child: Icon(
                Icons.check_circle_outline,
                size: Get.width / 3,
                color: Palette.green,
              ),
            ),
            const SizedBox(height: 20),
            // Text
            Text(
              'Berhasil!',
              style: MyTypography.headlineLarge
                  .copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Text(
              'Selamat kamu telah berhasil membuat akun baru!',
              style: MyTypography.headlineSmall
                  .copyWith(fontWeight: FontWeight.normal),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            // button
            OutlinedButton(
              onPressed: () {
                Get.offAllNamed<void>(RoutesName.loginPage);
              },
              child: Text(
                'Login Sekarang',
                style: MyTypography.bodyLarge,
              ),
            )
          ],
        ),
      ),
    );
  }
}
