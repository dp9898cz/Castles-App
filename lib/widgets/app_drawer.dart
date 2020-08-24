import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 270,
      color: Colors.black38,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: 70,
          ),
          Container(
            padding: EdgeInsets.only(left:25, bottom: 18,),
            child: Text(
              'Rozhledny',
              style: TextStyle(
                color: Colors.white,
                fontSize: 30,
                //decoration: TextDecoration.overline,//    rder.all(color: Colors.blue, style: BorderStyle.solid, width: 2),
              ),
              textAlign: TextAlign.end,
            ),
          ),
          SizedBox(
            height: 250,
            child: ListView(
              padding: EdgeInsets.all(10),
              children: [
                ListTile(
                  leading: Icon(
                    Icons.map,
                    color: Colors.white,
                  ),
                  title: Text(
                    'Mapa',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                    ),
                  ),
                ),
                Divider(
                  color: Colors.white,
                ),
                ListTile(
                  leading: Icon(
                    Icons.list,
                    color: Colors.white,
                  ),
                  title: Text(
                    'Seznam objektů',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                    ),
                  ),
                ),
                Divider(
                  color: Colors.white,
                ),
                ListTile(
                  leading: Icon(
                    Icons.settings,
                    color: Colors.white,
                  ),
                  title: Text(
                    'Nastavení',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
