class YoutubeModel {


  String _channelId;
  String _description;
  String _publishedAt;
  String _thumbnail;
  String _title;
  String _link;

  static List<YoutubeModel> fromJson(List<dynamic> json) {
    List<YoutubeModel> models = List<YoutubeModel>();
    for(int i = 0; i < json.length; i++) {
      models.add(
          YoutubeModel(
              json[i]['snippet']['channelId'],
              json[i]['snippet']['description'],
              json[i]['snippet']['publishedAt'],
              json[i]['snippet']['thumbnails']['default']['url'],
              json[i]['snippet']['title'],
              json[i]['id']['channelId']
          )
      );
    }
    return models;
  }


  YoutubeModel(this._channelId, this._description, this._publishedAt,
      this._thumbnail, this._title, this._link);

  String get channelId => _channelId;

  set channelId(String value) {
    _channelId = value;
  }

  String get description => _description;

  set description(String value) {
    _description = value;
  }

  String get publishedAt => _publishedAt;

  set publishedAt(String value) {
    _publishedAt = value;
  }

  String get thumbnail => _thumbnail;

  set thumbnail(String value) {
    _thumbnail = value;
  }

  String get title => _title;

  set title(String value) {
    _title = value;
  }

  String get link => _link;

  set link(String value) {
    _link = value;
  }


}