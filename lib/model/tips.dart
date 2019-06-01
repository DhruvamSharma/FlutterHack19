class Tips {
  final String tip;

  Tips.fromJson(Map<String, dynamic> json) :
        tip = json['tip'];
}