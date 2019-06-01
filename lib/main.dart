import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hack/screens/homeScreens/homePage.dart';
import 'package:flutter_hack/themes/homeTheme/theme1.dart';


void main() {
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
        runApp(MainActivity());
  });
}

class MainActivity extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter Community App",
      debugShowCheckedModeBanner: false,
      theme: buildThemeData(),
      home: HomePage(),
    );
  }
}
<<<<<<< HEAD

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            youtubeBloc.fetchYoutubeChannels();
            githubBloc.fetchGithubUsersChannels();
          },
          label: Text('Fetch'),
      ),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text("Dhruvam"),
              accountEmail: Text("dhruvamssharma@gmail.com"),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
                child: Text(
                  "D",
                  style: TextStyle(fontSize: 40.0),
                ),
              ),
            ),

            ListTile(
              title: Text("Item 1"),
              trailing: Icon(Icons.arrow_forward),
            ),
            ListTile(
              title: Text("Item 2"),
              trailing: Icon(Icons.arrow_forward),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            StreamBuilder<List<YoutubeModel>>(
              stream: youtubeBloc.youtubeStream,
              builder: (context, snapshot) {
                if(snapshot.hasData) {
                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: snapshot.data.length,
                    itemBuilder: (context, position) {
                      return ListTile(
                        title: Text(snapshot.data[position].thumbnail),
                      );
                    },
                  );
                } else if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                }
              }
            ),


            StreamBuilder<List<GithubModel>>(
                stream: githubBloc.githubStream,
                builder: (context, snapshot) {
                  if(snapshot.hasData) {
                    return ListView.builder(
                      shrinkWrap: true,
                      itemCount: snapshot.data.length,
                      itemBuilder: (context, position) {
                        return ListTile(
                          title: Text(snapshot.data[position].repos_url),
                        );
                      },
                    );
                  } else if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  }
                }
            ),
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
  }
}


=======
>>>>>>> 4786ba45098bb2c07ce01429043db6132fae8e27
