import 'package:event_app/core/env/env_config.dart';

class FlavorSettings {
  FlavorSettings.development() {
    EnvConfig.getInstance(
      apiBaseUrl: 'http://localhost/api.dunia.coding.id',
      flavorName: 'Development',
    );
  }

  FlavorSettings.staging() {
    EnvConfig.getInstance(
      apiBaseUrl: 'http://localhost/api.dunia.coding/staging',
      flavorName: 'Staging',
    );
  }

  FlavorSettings.production() {
    EnvConfig.getInstance(
      apiBaseUrl: 'http://localhost/api.dunia.coding/prod',
      flavorName: 'Production',
    );
  }
}
