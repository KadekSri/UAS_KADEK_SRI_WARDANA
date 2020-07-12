import 'package:flutter/material.dart';

class Detail extends StatelessWidget {
  Detail ({this.nama, this.gambar});
  final String nama;
  final String gambar;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(title: new Text("Detail $nama"), backgroundColor: Colors.red[700],),
      body: new Container(
        decoration: new BoxDecoration(
            image: new DecorationImage(image: new NetworkImage("https://lh3.googleusercontent.com/-gKp7i66veso/WQjZZfGmiFI/AAAAAAAADto/UsCmjfss6X0_x14lEBeSbCrC1KEpTR0RwCHM/s1600/wallpaper%252Bputih%252B%2Ball-white-wallpaper-0.jpg"),
                fit: BoxFit.cover
            )
        ),
        child: new Center(
            child: new Image(image: new NetworkImage(gambar))
        ) ,
      ),
    );
  }
}
