import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../../features/auth/data/models/auth_model/auth_model.dart';

//CacheHelper That's Connect and Talk to local database.

class CacheHelper {
  late SharedPreferences sharedPreferences;

  init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  String? getDataString({
    required String key,
  }) {
    return sharedPreferences.getString(key);
  }

// this fun to put data in local data base using key

  Future<bool> saveData({required String key, required dynamic value}) async {
    if (value is bool) {
      return await sharedPreferences.setBool(key, value);
    }
    if (value is String) {
      return await sharedPreferences.setString(key, value);
    }

    if (value is int) {
      return await sharedPreferences.setInt(key, value);
    } else {
      return await sharedPreferences.setDouble(key, value);
    }
  }

  // this fun to get data already saved in local data base

  dynamic getData({required String key}) {
    return sharedPreferences.get(key);
  }

// remove data using specific key

  Future<bool> removeData({required String key}) async {
    return await sharedPreferences.remove(key);
  }

  Future<bool> containsKey({required String key}) async {
    return sharedPreferences.containsKey(key);
  }

  //clear all data in the local data base
  Future<bool> clearData() async {
    return await sharedPreferences.clear();
  }

  Future<void> saveAuthModel({required AuthModel authModel}) async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    final String authJson = jsonEncode(authModel.toJson());
    sharedPreferences.setString('auth', authJson);
  }

  Future<AuthModel?> getAuthModel() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    final String? authJson = sharedPreferences.getString('auth');
    if (authJson != null) {
      final Map<String, dynamic> authMap = jsonDecode(authJson);
      return AuthModel.fromJson(authMap);
    }
    return null;
  }

  Future<void> saveId({required String key, required String id}) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setString(key, id);
  }

  Future<String?> getId({required String key}) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString(key);
  }
}
