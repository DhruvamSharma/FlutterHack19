class GithubModel {

  String _login;
  String _avatarUrl;
  String _url;
  String _repos_url;
  String _html_url;
  UserDetail _userDetail;
  List<GithubRepo> _repos;

  GithubModel(this._login, this._avatarUrl, this._url, this._repos_url,
      this._html_url);


  static List<GithubModel> fromJson(List<dynamic> json) {
    var githubModels = List<GithubModel>();

    for (int i = 0; i < json.length; i ++) {
      githubModels.add(
        GithubModel(
            json[i]['login'],
            json[i]['avatar_url'],
            json[i]['url'],
            json[i]['repos_url'],
            json[i]['html_url']
        )
      );
    }

    return githubModels;
  }

  List<GithubRepo> get repos => _repos;

  set repos(List<GithubRepo> value) {
    _repos = value;
  }

  UserDetail get userDetail => _userDetail;

  set userDetail(UserDetail value) {
    _userDetail = value;
  }

  String get html_url => _html_url;

  set html_url(String value) {
    _html_url = value;
  }

  String get repos_url => _repos_url;

  set repos_url(String value) {
    _repos_url = value;
  }

  String get url => _url;

  set url(String value) {
    _url = value;
  }

  String get avatarUrl => _avatarUrl;

  set avatarUrl(String value) {
    _avatarUrl = value;
  }

  String get login => _login;

  set login(String value) {
    _login = value;
  }


}

class UserDetail {
  String _bio;
  int _followers;

  UserDetail(this._bio, this._followers);

  static UserDetail fromJson(Map<String, dynamic> json) {
    return UserDetail(
      json['bio'],
      json['followers']
    );
  }

  int get followers => _followers;

  set followers(int value) {
    _followers = value;
  }

  String get bio => _bio;

  set bio(String value) {
    _bio = value;
  }


}

class GithubRepo {
  String _name;
  String _language;
  int _fork_count;
  int _stargazers_count;
  String _html_url;


  String get name => _name;

  set name(String value) {
    _name = value;
  }

  GithubRepo(this._name, this._language, this._fork_count,
      this._stargazers_count, this._html_url);

  static List<GithubRepo> fromJson(List<dynamic> json) {
    var repos = List<GithubRepo>();
    for (int i = 0; i < json.length; i++) {
      repos.add(
        GithubRepo(
          json[i]['name'],
          json[i]['language'],
          json[i]['forks_count'],
          json[i]['stargazers_count'],
          json[i]['html_url']
        )
      );
    }

    return repos;
  }

  String get language => _language;

  set language(String value) {
    _language = value;
  }

  int get fork_count => _fork_count;

  set fork_count(int value) {
    _fork_count = value;
  }

  int get stargazers_count => _stargazers_count;

  set stargazers_count(int value) {
    _stargazers_count = value;
  }

  String get html_url => _html_url;

  set html_url(String value) {
    _html_url = value;
  }
}