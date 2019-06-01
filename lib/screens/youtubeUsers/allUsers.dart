import 'package:flutter/material.dart';
import 'package:flutter_hack/bloc/youtube_bloc.dart';
import 'package:flutter_hack/model/YoutubeModel.dart';
import 'package:flutter_hack/screens/webViewContainer/webView.dart';

class AllFlutterUsers extends StatefulWidget {
  @override
  _AllFlutterUsersState createState() => _AllFlutterUsersState();
}

class _AllFlutterUsersState extends State<AllFlutterUsers> {

  static const cardColor = Color.fromRGBO(64, 75, 96, 0.9);

  @override
  void initState() {
    // TODO: implement initState
    youtubeBloc.fetchYoutubeChannels();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Top Flutter Channels"),
      ),
      body: Container(
        child: StreamBuilder<List<YoutubeModel>>(
            stream: youtubeBloc.youtubeStream,
            builder: (context, snapshot) {
              print("connection state ${snapshot.connectionState}");
              print("data ${snapshot.data}");
              print("error ${snapshot.error}");
              switch (snapshot.connectionState){
                case ConnectionState.none:
                case ConnectionState.waiting:
//                  return
//                    Center(
//                    child: FlareActor("assets/Load.flr", animation: "Loading", shouldClip: true,),
//                  );
                return Center(child: CircularProgressIndicator(),);
                case ConnectionState.active:

                case ConnectionState.done:
                  if (snapshot.hasError) return Center(
                    child: Text("Error", style: TextStyle(
                        color: Colors.white
                    ),),
                  );
                  return ListView.builder(
                    physics: AlwaysScrollableScrollPhysics(),
                      itemCount: snapshot.data?.length ?? 0,

                      itemBuilder: (BuildContext context, int index) {
                      return Card(
                        color: cardColor,
                        elevation: 2.0,
                        shape: RoundedRectangleBorder(
                          borderRadius:BorderRadius.circular(12.0)
                        ),
                        margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: cardColor,
                            borderRadius:BorderRadius.circular(12.0)
                          ),
                          child: ListTile(
                            contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                            leading: CircleAvatar(
                              backgroundImage: NetworkImage(snapshot.data[index].thumbnail),
                            ),
                            title: Text(snapshot.data[index].title, style: TextStyle(color: Colors.white),),
                            subtitle: Padding(
                            padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                            child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[

                              Text(snapshot.data[index].description)
                            ],
                          ),
                        ),
                            onTap: () async{
                              Navigator.push(context, MaterialPageRoute(
                                  builder: (context) => WebViewContainer(
                                      "https://www.youtube.com/channel/${snapshot.data[index].link}", snapshot.data[index].title
                                  )));
                            },

                          ),
                        ),
                      );
                      });

              }
      })
      ),

    );
  }
}

