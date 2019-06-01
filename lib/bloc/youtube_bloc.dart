

import 'package:flutter_hack/model/YoutubeModel.dart';
import 'package:flutter_hack/services/youtube_service.dart';
import 'package:rxdart/rxdart.dart';

class YoutubeBloc {

  YoutubeApiProvider _service = YoutubeApiProvider();
  Stream<List<YoutubeModel>> get youtubeStream => youtubeStreamController.stream;

  final youtubeStreamController = BehaviorSubject<List<YoutubeModel>>();

  void fetchYoutubeChannels() async{
    _service.getFlutterYoutubeChannels().then((event) {
      print(event.length);
      youtubeStreamController.sink.add(event);
    });
  }

  void dispose() {
    youtubeStreamController.close();
  }

}

var youtubeBloc = YoutubeBloc();