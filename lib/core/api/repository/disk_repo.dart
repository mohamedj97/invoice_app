import 'package:shared_preferences/shared_preferences.dart';

import '../models/tokens_data.dart';


const String _tokensDataKey = "tokens_data";
const String _firstLoginKey = "first_login";
const String _userNameKey = "user_name";

class DiskRepo {
  static final DiskRepo _singleton = DiskRepo._internal();

  factory DiskRepo() => _singleton;

  DiskRepo._internal();

  late SharedPreferences sharedPreferences;

  Future ensureInitialized() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  Future clearAll() async {
    await sharedPreferences.clear();
  }

  TokensData? loadTokensData() {
    if (!sharedPreferences.containsKey(_tokensDataKey)) {
      return null;
    }
    final value = sharedPreferences.getString(_tokensDataKey);
    if (value == null || value.isEmpty) {
      return null;
    }
    return TokensData.parse(value);
  }

  Future updateTokensData(TokensData tokensData) async {
    await sharedPreferences.setString(_tokensDataKey, tokensData.toString());
  }
  bool? loadFirstLogin() {
    if (!sharedPreferences.containsKey(_firstLoginKey)) {
      return null;
    }
    final value = sharedPreferences.getBool(_firstLoginKey);
    if (value == null) {
      return null;
    }
    return value;
  }

  Future updateFirstLogin(bool firstLogin) async {
    await sharedPreferences.setBool(_firstLoginKey, firstLogin);
  }

  Future deleteFirstLogin() async {
    await sharedPreferences.remove(_firstLoginKey);
  }


  String? loadUserName() {
    if (!sharedPreferences.containsKey(_userNameKey)) {
      return null;
    }
    final value = sharedPreferences.getString(_userNameKey);
    if (value == null) {
      return null;
    }
    return value;
  }

  Future updateUserName(String userName) async {
    await sharedPreferences.setString(_userNameKey, userName);
  }

  Future deleteUserName() async {
    await sharedPreferences.remove(_userNameKey);
  }

  Future deleteTokensData() async {
    await sharedPreferences.remove(_tokensDataKey);
  }
}
