import 'package:flutter/material.dart';
import 'package:flutter_hack/screens/youtubeUsers/allUsers.dart';

class NavDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          Container(
            padding: EdgeInsets.fromLTRB(5.0, 0.0, 0.0, 0.0),
            margin: EdgeInsets.fromLTRB(5.0, 0.0, 0.0, 0.0),
            child: Column(
              children: <Widget>[
                ListTile(
                  title: Text("Top Flutter Channels"),
                  onTap: () {
                    Navigator.of(context).pop();
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) => AllFlutterUsers()));

                  },
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
