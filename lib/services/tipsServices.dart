import 'package:flutter_hack/model/tips.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class TipsService {
  static String _url = "https://us-central1-tested-201415.cloudfunctions.net/flutter-tips";

  static Future browse() async {
    http.Response response = await http.get(_url);

    await Future.delayed(Duration(seconds: 2));

    String content = response.body;
    List collection = json.decode(content);
    List<Tips> _toptips =
    collection.map((json) => Tips.fromJson(json)).toList();

    return _toptips;
  }
}