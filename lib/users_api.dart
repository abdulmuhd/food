import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:food/user_model.dart';
import 'package:http/http.dart' as http;

class UserApi {
  static Future<List<UserModel>> getProductfs() async {
    const url = 'https://pastebin.com/raw/X9qwc0tJ';

    final response = await http.get(
      Uri.parse(url),
    );

    if (response.statusCode == 200) {
      final List<dynamic> result = json.decode(response.body);

      return result.map((e) => UserModel.fromJson(e)).toList();
    } else {
      throw Exception('failed to load data');
    }
  }

  static Future<List<UserModel>> getProductsLocally(
      BuildContext context) async {
    final assetsbundle = DefaultAssetBundle.of(context);

    final data = await assetsbundle.loadString('assets/products.json');
    final body = json.decode(data);

    return body;
  }
}
