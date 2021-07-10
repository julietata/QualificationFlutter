import 'package:flutter/material.dart';
import 'package:main/models/review.dart';
import 'package:main/utils/globals.dart' as globals;
import 'package:main/view/itempage.dart';
import 'package:main/view/login.dart';
import 'package:main/view/navigationbar.dart';

class ListDetailPage extends StatefulWidget {
  
  String img;
  String name;
  String price;
  String desc;

  ListDetailPage(this.img, this.name, this.price, this.desc);
  
  @override
  State<StatefulWidget> createState() {
    return DetailState(img, name, price, desc);
  }
}

class DetailState extends State<ListDetailPage>{

  String img;
  String name;
  String price;
  String desc;

  DetailState(this.img, this.name, this.price, this.desc);

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

  var _ctrlComment = TextEditingController();
  var temp = [];

  void _onPressed(ctx){
    if (_ctrlComment.text.isEmpty){
      ScaffoldMessenger.of(ctx).showSnackBar(
        SnackBar(content: Text('Comment cannot be empty!'))
      );
    }
    else {
      setState(() {
        reviews.add(new Review(name, _ctrlComment.text, globals.username));
      _ctrlComment.text = "";
      });
    }
  }

  Widget _buildWidget(Review r) {
    return Card(
      child: ListTile(
        leading: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: 44,
            minWidth: 10,
            maxHeight: 64,
            maxWidth: 24,
          )
        ),
        title: Text(r.comment + ' by ' + r.username)
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    temp.clear();
    for (var i = 0; i < reviews.length; i++){
      if (reviews[i].product == name){
        temp.add(reviews[i]);
      }
    }
    return DefaultTabController(length: 2, child: Scaffold(
      appBar: AppBar(
              title: Text('Helo, ${globals.username}'),
              backgroundColor: Colors.pink,
              bottom: TabBar(tabs: [
                Tab(icon: Icon(Icons.add_shopping_cart)),
                Tab(icon: Icon(Icons.add_comment))
              ],)),
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
      body: TabBarView(children: [
        SingleChildScrollView(
        child: Column(
        children: [Image(image: AssetImage('assets/$img')),
        Padding(padding: const EdgeInsets.fromLTRB(20, 40, 20, 0), child: Column(children: [Text(name, style: TextStyle(height: 2)), Text('Price: ' + price, style: TextStyle(height: 2)), Text(desc, style: TextStyle(height: 2))],
        )
        ),
        Padding(padding: const EdgeInsets.all(30), child: 
        TextField(decoration: InputDecoration(
                hintText: 'Review / Comments', contentPadding: const EdgeInsets.all(10)), controller: _ctrlComment)),
        ElevatedButton(onPressed: ()=>_onPressed(context), child: Text('Submit'),
              style: ElevatedButton.styleFrom(
                  primary: Colors.pink,
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 0)))
        ],
      ),
      ),
      ListView(
          children: temp.map((e) => _buildWidget(e)).toList()
        ),
      ])
    )
    );
  }
}