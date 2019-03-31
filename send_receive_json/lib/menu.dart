import 'package:flutter/material.dart';
import 'package:send_receive_json/sendjson.dart';
import 'package:send_receive_json/receivejson.dart';

class Menu extends StatefulWidget {
  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Menu"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

            RaisedButton(
              child: Text("Send json"),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (BuildContext context) => SendJson(),
                ));
                debugPrint("send json button");
              },
            ),

            RaisedButton(
              child: Text("Retrieve json"),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (BuildContext context) => ReceiveJson(),
                ));
                debugPrint("retrive json button");
              },
            ),

          ],
        ),
      ),
    );
  }
}
