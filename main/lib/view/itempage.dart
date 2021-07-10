import 'package:flutter/material.dart';
import 'package:main/utils/globals.dart' as globals;
import 'package:main/view/homepage.dart';
import 'package:main/view/items.dart';
import 'package:main/view/login.dart';
import 'package:main/view/navigationbar.dart';

class ItemPage extends StatelessWidget {

  void homePressed(BuildContext context){
    Navigator.push(context, MaterialPageRoute(builder: (builder) {
      return Navigation();
    }));
  }

    void ItemPressed(BuildContext context){
    Navigator.push(context, MaterialPageRoute(builder: (builder) {
      return ItemPage();
    }));
  }

    void logoutPressed(BuildContext context){
    Navigator.push(context, MaterialPageRoute(builder: (builder) {
      return LoginPage();
    }));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          appBar: AppBar(
              title: Text('Helo, ${globals.username}'),
              backgroundColor: Colors.pink),
          drawer: Drawer(
              child: ListView(
            children: [
              ListTile(
                title: TextButton(child: Text('Home'), onPressed: ()=> homePressed(context)),
              ),
              ListTile(
                title: TextButton(child: Text('Item List'), onPressed: ()=> ItemPressed(context)),
              ),
              ListTile(
                title: TextButton(child: Text('Logout'), onPressed: ()=> logoutPressed(context)),
              ),
            ],
          )
          ),
          body: Item()),
    );
  }
}