import 'package:event_app/core/env/env_config.dart';

class FlavorSettings {
  FlavorSettings.development() {
    EnvConfig.getInstance(
      apiBaseUrl: 'https://api1.coursedca.com',
      flavorName: 'Development',
    );
  }

  FlavorSettings.staging() {
    EnvConfig.getInstance(
      apiBaseUrl: 'https://api1.coursedca.com',
      flavorName: 'Staging',
    );
  }

  FlavorSettings.production() {
    EnvConfig.getInstance(
      apiBaseUrl: 'https://api1.coursedca.com',
      flavorName: 'Production',
    );
  }
}
