import 'dart:async';

import 'package:flutter_hack/model/tips.dart';
import 'package:flutter_hack/services/tipsServices.dart';


class TipsManager {

  Stream<List<Tips>> get newsListView async* {
    yield await TipsService.browse();
  }
}