import 'package:event_app/core/constants/key_constant.dart';
import 'package:event_app/core/di/injection.dart';
import 'package:event_app/core/prefs/shared_prefs.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final prefs = sl<SharedPrefs>();
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Home Page'),
            ElevatedButton(
              onPressed: () {
                prefs.clearKey(KeyConstant.token);
              },
              child: const Text('Logout'),
            )
          ],
        ),
      ),
    );
  }
}
