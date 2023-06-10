import 'package:flutter/material.dart';

class LoginImage extends StatelessWidget {
  const LoginImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
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
      ],
    );
  }
}
