import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class ReceiveJson extends StatefulWidget {
  @override
  _ReceiveJsonState createState() => _ReceiveJsonState();
}

class _ReceiveJsonState extends State<ReceiveJson> {

  // variable
  String url = "http://ams-api.astro.com.my/ams/v3/getChannelList";
  List data;

  @override
  void initState() {
    super.initState();
    this.makeRequest();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Senarai channel astro"),
      ),
      body: ListView.builder(
        itemCount: data == null ? 0 : data.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.all(10.0),
            child: Card(
              elevation: 6.0,
              child: ListTile(
                title: Text("${data[index]["channelTitle"]}"),
                leading: Text("${data[index]["channelStbNumber"]}"),
              ),
            ),
          );
        },
      ),
    );
  }

  Future<String> makeRequest() async {
    debugPrint("masuk makeRequest");
    var response = await http.get(Uri.encodeFull(url), headers: {"Accept" : "application/json"} );

    setState(() {
      var extractdata = json.decode(response.body);
      data = extractdata["channels"];
      debugPrint("data: ${data}");
    });

    return "done";

  }

}
