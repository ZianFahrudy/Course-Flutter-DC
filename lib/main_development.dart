import 'dart:developer';

import 'package:event_app/app/app.dart';
import 'package:event_app/bootstrap.dart';
import 'package:event_app/core/env/env_config.dart';
import 'package:event_app/core/env/flavors.dart';
import 'package:flutter/foundation.dart';

void main() async {
  FlavorSettings.development();

  await bootstrap(() => const App());

  /// console flavor running
  if (!kReleaseMode) {
    final setting = EnvConfig.getInstance();

    log('${setting!.flavorName}', name: 'Flavor Name');
    log('${setting.apiBaseUrl}', name: 'BASE URL');
  }
}
