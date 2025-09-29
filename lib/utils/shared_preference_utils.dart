import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:shared_preferences/shared_preferences.dart';

// class SharedPreferenceUtils {
//   static const String _dataKey = 'DATA';
//
//   static Future<String?> getData() async {
//     final SharedPreferences prefs = await SharedPreferences.getInstance();
//     final data = prefs.getString(_dataKey);
//     if(data == null) {
//       return null;
//     }
//
//     return sha1.
//   }
//
//   static Future<bool> saveData(Map<String, dynamic> jsonData) async {
//     final SharedPreferences prefs = await SharedPreferences.getInstance();
//     var digest = sha1.convert(utf8.encode(originData));
//     return prefs.setString(_dataKey, '$digest');
//   }
// }