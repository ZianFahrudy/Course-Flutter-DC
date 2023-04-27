// ignore_for_file: public_member_api_docs, sort_constructors_first, join_return_with_assignment, lines_longer_than_80_chars
class EnvConfig {
  final String? flavorName;
  final String? apiBaseUrl;
  EnvConfig({
    this.flavorName,
    this.apiBaseUrl,
  });

  static EnvConfig? _instance;
  static EnvConfig? getInstance({
    String? flavorName,
    String? apiBaseUrl,
  }) {
    if (_instance == null) {
      _instance = EnvConfig(
        apiBaseUrl: apiBaseUrl,
        flavorName: flavorName,
      );

      return _instance;
    } else {
      return _instance;
    }
  }
}
