import 'package:flutter_hack/models/GithubModel.dart';
import 'package:flutter_hack/service/github_service.dart';
import 'package:rxdart/rxdart.dart';

class YoutubeBloc {

  GithubApiProvider _service = GithubApiProvider();
  Stream<List<GithubModel>> get githubStream => githubStreamController.stream;

  final githubStreamController = BehaviorSubject<List<GithubModel>>();

  void fetchGithubUsersChannels() async{
    _service.getFlutterGithubUsers().then((event) {
      githubStreamController.sink.add(event);
    });
  }

  void dispose() {
    githubStreamController.close();
  }

}

var githubBloc = YoutubeBloc();