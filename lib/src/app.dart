import 'package:crud/detail.dart';
import 'package:crud/src/ui/formadd/form_add_screen.dart';
import 'package:crud/src/ui/home/home_screen.dart';
import 'package:flutter/material.dart';

GlobalKey<ScaffoldState> _scaffoldState = GlobalKey<ScaffoldState>();

class App extends StatefulWidget {
  @override
  _HomeState createState() => new _HomeState();
}
class _HomeState extends State<App> {

  String gambar1="https://upload.wikimedia.org/wikipedia/id/thumb/7/7f/Mickey_Mouse.svg/1200px-Mickey_Mouse.svg.png";
  String gambar2="https://undiksha.ac.id/wp-content/uploads/2016/10/new-Logo-Undiksha-300x293.png";
  String backup;
  String setting;

  String nama1="KADEK SRI WARDANA";
  String nama2="SRI WARDANA GANTENG";
  String backupnama;

  void gantiuser(){
    this.setState((){
      backup=gambar1;
      gambar1=gambar2;
      gambar2=backup;
      backup=setting;

      backupnama=nama1;
      nama1=nama2;
      nama2=backupnama;
    });
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.yellowAccent,
        accentColor: Colors.purpleAccent,
      ),
      home: Scaffold(
        drawer: new Drawer(
          child: new ListView(
            children: <Widget>[
              new UserAccountsDrawerHeader(
                accountName: new Text(nama1),
                accountEmail: new Text("sri.wardana@undiksha.ac.id"),
                currentAccountPicture:
                new GestureDetector(
                  onTap: ()=> Navigator.of(context).push(new MaterialPageRoute(
                      builder: (BuildContext context)=> new Detail(nama: nama1, gambar: gambar1,)
                  )),

                  child: new CircleAvatar(
                    backgroundImage: new NetworkImage(gambar1),
                  ),
                ),
                decoration: new BoxDecoration(
                    image: new DecorationImage(image: new NetworkImage("https://lh3.googleusercontent.com/-gKp7i66veso/WQjZZfGmiFI/AAAAAAAADto/UsCmjfss6X0_x14lEBeSbCrC1KEpTR0RwCHM/s1600/wallpaper%252Bputih%252B%2Ball-white-wallpaper-0.jpg"),
                        fit: BoxFit.cover
                    )
                ),
                otherAccountsPictures: <Widget>[
                  new GestureDetector(
                      onTap: ()=> gantiuser(),
                      child: new CircleAvatar(backgroundImage: new NetworkImage(gambar2),)
                  )

                ],
              ),

              new ListTile(
                title: new Text("Pengaturan Profile"),
                trailing: new Icon(Icons.settings),
                onTap: () {
                  Navigator.push(
                    _scaffoldState.currentContext,
                    MaterialPageRoute(builder: (BuildContext context) {
                      return FormAddScreen();
                    }),
                  );
                },
                ),

              new ListTile(
                  title: new Text("Keluar"),
                  trailing: new Icon(Icons.close)
              ),
            ],
          ),
        ),
        key: _scaffoldState,
        appBar: AppBar(
          title: Text("UAS KADEK SRI WARDANA", style:
          TextStyle(color: Colors.black,
          ),
          ),
          actions: <Widget>[
            GestureDetector(
              onTap: () {
                Navigator.push(
                  _scaffoldState.currentContext,
                  MaterialPageRoute(builder: (BuildContext context) {
                    return FormAddScreen();
                  }),
                );
              },
              child: Padding(
                padding: const EdgeInsets.only(right: 16.0),
                child: Icon(
                  Icons.add,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
        body: HomeScreen(),
      ),
    );
  }
}



