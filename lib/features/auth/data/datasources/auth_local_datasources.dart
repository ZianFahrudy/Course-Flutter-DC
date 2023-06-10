// ignore_for_file: one_member_abstracts

import 'package:event_app/core/constants/key_constant.dart';
import 'package:event_app/core/prefs/shared_prefs.dart';

abstract class AuthLocalDatasources {
  Future<bool> saveToken(String token);
}

class AuthLocalDatasourcesImpl implements AuthLocalDatasources {
  AuthLocalDatasourcesImpl(this.sharedPrefs);
  final SharedPrefs sharedPrefs;
  @override
  Future<bool> saveToken(String token) async {
    return sharedPrefs.putString(KeyConstant.token, token);
  }
}
