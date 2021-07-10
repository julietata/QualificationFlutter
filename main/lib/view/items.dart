import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:main/models/location.dart';
import 'package:main/view/detail.dart';
import 'package:main/view/navigationbar.dart';
import 'package:main/utils/globals.dart' as globals;

class Item extends StatelessWidget {
  var _ctx = null;
  var _data = [
    Location('1.jpg', 'Chocolate', '45000', 'Chocolate flavour hehe :)'),
    Location('2.jpg', 'Strawberry', '40000', 'Strawberry is red hehe :)'),
    Location('3.jpg', 'Vanilla', '50000', 'Vanilla is sweet :)'),
    Location('4.jpg', 'Matcha', '55000', 'Matcha is green and bitter :)'),
  ];

  void _onPressed(Location l) {
    Navigator.push(_ctx, MaterialPageRoute(builder: (builder) {
      return ListDetailPage(l.img, l.name, l.price, l.desc);
    }));
  }

  Widget _buildWidget(Location l) {
    return Card(
      child: ListTile(
        leading: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: 44,
            minWidth: 44,
            maxHeight: 64,
            maxWidth: 64,
          ),
          child: Image.asset(
            'assets/${l.img}',
            fit: BoxFit.cover,
          ),
        ),
        title: Text(l.name),
        trailing: ElevatedButton(
            child: Text('Details'),
            onPressed: () => _onPressed(l),
            style: ElevatedButton.styleFrom(primary: Colors.pink)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    _ctx = context;
    return ListView(children: _data.map((e) => _buildWidget(e)).toList());
  }
}
