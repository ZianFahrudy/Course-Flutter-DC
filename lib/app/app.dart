import 'package:event_app/common/app_theme.dart';
import 'package:event_app/common/utils/palette.dart';
import 'package:event_app/common/utils/typography.dart';
import 'package:event_app/core/constants/key_constant.dart';
import 'package:event_app/core/di/injection.dart';
import 'package:event_app/core/prefs/shared_prefs.dart';
import 'package:event_app/core/routes/routes.dart';
import 'package:event_app/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  final prefs = sl<SharedPrefs>();
  @override
  Widget build(BuildContext context) {
    final isLogin = prefs.isKeyExists(KeyConstant.token);

    return GetMaterialApp(
      theme: AppTheme.light(Palette.primary, MyTypography.textTheme),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      initialRoute: isLogin ? RoutesName.mainNavigation : RoutesName.loginPage,
      getPages: Routes.page.map((page) => page).toList(),
    );
  }
}
