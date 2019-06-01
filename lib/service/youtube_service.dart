import 'package:flutter_hack/models/YoutubeModel.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as json;
class YoutubeApiProvider {

  String _baseUrl = 'https://www.googleapis.com/youtube/v3/search/?part=snippet&key=AIzaSyCTgxhXEMnjaAoxHkOPkz57GigtCni_t-8&q=flutter';

  Future<List<YoutubeModel>> getFlutterYoutubeChannels() async{

    http.Response response;

    try {
      response = await http.get(_baseUrl);
    } catch(e) {
      print('error found');
    }

    if(response.statusCode == 200) {
      var body = json.jsonDecode(response.body);
      print(body);
      var models = YoutubeModel.fromJson(body['items']);
      return models;
    } else {
      print('error');
      return null;
    }
  }

}