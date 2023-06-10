import 'package:event_app/common/utils/palette.dart';
import 'package:event_app/common/utils/typography.dart';
import 'package:event_app/components/button/my_outlined_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/routes/routes.dart';

class LoginBottomBar extends StatelessWidget {
  const LoginBottomBar({super.key, this.onPressed});

  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerRight,
          child: TextButton(
            onPressed: () {},
            child: Text(
              'Forgot password ?',
              style: MyTypography.bodyMedium.copyWith(color: Palette.primary),
            ),
          ),
        ),
        MyOutlinedButton(text: 'Login', onPressed: onPressed),
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
              onTap: () {
                Get.toNamed<void>(RoutesName.registerPage);
              },
              child: Text(
                'Daftar Sekarang',
                style: MyTypography.bodyMedium.copyWith(color: Palette.primary),
              ),
            )
          ],
        ),
      ],
    );
  }
}
