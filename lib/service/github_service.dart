import 'package:flutter_hack/models/GithubModel.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as json;
class GithubApiProvider {

  Future<List<GithubModel>> getFlutterGithubUsers() async{
    String _baseUrl = 'https://api.github.com/search/users?q=flutter';

    http.Response response;

    try {
      response = await http.get(_baseUrl);
    } catch(e) {
      print('error found');
    }

    if(response.statusCode == 200) {
      var body = json.jsonDecode(response.body);
      var models = GithubModel.fromJson(body['items']);
      prepareUserObject(models).then((value) {
        models = value;
        return value;
      });
      return models;
    } else {
      print('error');
      return null;
    }
  }

  Future<List<GithubModel>> prepareUserObject(List<GithubModel> models) async {

    var modelList = List<GithubModel>();

    for (int i = 0; i < models.length; i ++ ) {
      _fetchRepoDetails(models[i]).then((modelList) {
        models[i].repos = modelList;

        _fetchUserDetails(models[i]).then((userDetail) {
          models[i].userDetail = userDetail;
        });
      });
    }

    return modelList;
  }

  Future<List<GithubRepo>> _fetchRepoDetails(GithubModel model) async{

    http.Response response;

    try {
      response = await http.get(model.repos_url);
    } catch(e) {
      print('error found');
    }

    if(response.statusCode == 200) {
      var body = json.jsonDecode(response.body);
      var repos = GithubRepo.fromJson(body);
      return repos;
    } else {
      print('error in repos');
      return null;
    }

  }


  Future<UserDetail> _fetchUserDetails(GithubModel model) async{

    http.Response response;

    try {
      response = await http.get(model.url);
    } catch(e) {
      print('error found');
    }

    if(response.statusCode == 200) {
      var body = json.jsonDecode(response.body);
      var userDetail = UserDetail.fromJson(body);
      print(userDetail.bio);
      return userDetail;
    } else {
      print('error in user');
      return null;
    }

  }

}