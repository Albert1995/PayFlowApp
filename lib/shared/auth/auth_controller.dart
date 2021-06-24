import 'package:flutter/material.dart';
import 'package:payflow/shared/models/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController {
  bool _isAuthenticated = false;

  User? _user;

  User get user => this._user!;
  get isAuthenticated => this._isAuthenticated;

  void setUser(BuildContext context, User? user) {
    this._isAuthenticated = user != null;

    if (user != null) {
      this._user = user;
      saveUser(user);
      Navigator.pushReplacementNamed(context, "/home");
    } else {
      Navigator.pushReplacementNamed(context, "/login");
    }
  }

  Future<void> saveUser(User user) async {
    final sharedPreferencesInstance = await SharedPreferences.getInstance();
    await sharedPreferencesInstance.setString("user", user.toJson());
    return;
  }

  Future<void> loadUserAuthenticated(BuildContext context) async {
    final sharedPreferencesInstance = await SharedPreferences.getInstance();
    User? user;

    if (sharedPreferencesInstance.containsKey("user")) {
      final json = sharedPreferencesInstance.getString("user") as String;
      user = User.fromJson(json);
    }

    await Future.delayed(Duration(seconds: 2));

    this.setUser(context, user);
    return;
  }
}
