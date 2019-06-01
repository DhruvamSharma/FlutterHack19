import 'package:flutter/material.dart';
import 'package:flutter_hack/model/tips.dart';
import 'package:flutter_hack/model/tipsManager.dart';
import 'package:flutter_hack/screens/homeScreens/customshapeclipper.dart';
import 'package:flutter_hack/screens/homeScreens/navDrawer.dart';
import 'package:flutter_hack/screens/youtubeUsers/allUsers.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("HomePage"),
        elevation: 0.0,

      actions: <Widget>[
        PopupMenuButton<String>(
          onSelected:
              (value){
            switch(value){
              case "About" :
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => AboutApp())
                );
                break;
//              case "Settings" :
//                Navigator.of(context).push(MaterialPageRoute(
//                    builder: (BuildContext context) => AppSettings())
//                );
            }
          },
          itemBuilder: (BuildContext context){
            return AppBarContent.options.map((String option){
              return PopupMenuItem<String>(
                value: option,
                child: Text(option),
              );
            }).toList();
          },
        )


      ],),
//      drawer: NavDrawer(),

      body: Column(
        children: <Widget>[
          TopPart(),
          BottomPart()


        ],
      ),
    );
  }
}

class AboutApp extends StatefulWidget {

  @override
  _AboutAppState createState() => _AboutAppState();
}

class _AboutAppState extends State<AboutApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("About"),
      ),
      body: Center(
        child: Text("About"),
      ),
    );
  }
}

class AppBarContent {
  /*set the constats*/
  static const String about = "Version 1.0.0";


  /*create the list of above defined constants*/
  static const List<String> options = <String>[
    about,
  ];


}


class TopPart extends StatefulWidget {
  @override
  _TopPartState createState() => _TopPartState();
}

class _TopPartState extends State<TopPart> {

  TipsManager manager = TipsManager();
  var day = DateTime.now().day;
  var month = DateTime.now().month;
  static const cardColor = Color.fromRGBO(64, 75, 96, 0.9);

  Widget _homePageTopCard(BuildContext context, Tips alltips){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: SingleChildScrollView(
        child: Text(alltips.tip, style: TextStyle(
            fontSize: 20.0, color: Colors.white, height: 1.2), textAlign: TextAlign.center,),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        ClipPath(
          clipper: CustomShapeClipper(),
          child: Container(
            height: MediaQuery.of(context).size.height * 0.50,
            width: MediaQuery.of(context).size.width,
            color: cardColor,
            child: Column(
    children: <Widget>[
      Padding(
        padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 40.0, bottom: 16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Text("Flutter Tips", style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 24.0
            ),),
            Spacer(),
            (month == 5) ? Text("$day May", style: TextStyle(
                color: Colors.white, fontSize: 18.0
            ),) : Text("$day June", style: TextStyle(
                color: Colors.white, fontSize: 18.0
            ),)

          ],
        ),
      ),
      Container(
          margin: const EdgeInsets.symmetric(vertical: 12.0),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.30,
          color: Colors.transparent,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 0.0),
            child: StreamBuilder(
                stream: manager.newsListView,
                builder: (BuildContext context, AsyncSnapshot<List<Tips>> snapshot){

                  switch (snapshot.connectionState) {
                    case ConnectionState.none:
                    case ConnectionState.waiting:
                    return Center(child: CircularProgressIndicator(),);
                    case ConnectionState.active:

                    case ConnectionState.done:
                      List<Tips> alltips = snapshot.data;

                      return ListView.builder(

                          scrollDirection: Axis.horizontal,
                          itemCount: alltips?.length ?? 0,
                          itemExtent: MediaQuery.of(context).size.width,
                          itemBuilder: (BuildContext context, int index) {


                            return _homePageTopCard(context, alltips[index]);
                          });
                  }

                }),
          )
      )


    ]
          ),

        ),
        )
      ],
    );
  }
}

class BottomPart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 100),
      child: Center(
        child: ButtonTheme(

          height: 80,
          minWidth: 150,
          child: RaisedButton(
            onPressed: () {Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => AllFlutterUsers()));},
            elevation: 15,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
            child: Text("Top Youtube Developers", style: TextStyle(color: Colors.white),),
            color: Colors.blue[900],
          ),
          
          ),
      ),
    );
  }
}
