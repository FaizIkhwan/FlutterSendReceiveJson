import 'package:flutter/material.dart';
import 'package:send_receive_json/contact.dart';
import 'package:send_receive_json/contactservice.dart';

class SendJson extends StatefulWidget {
  @override
  _SendJsonState createState() => _SendJsonState();
}

class _SendJsonState extends State<SendJson> {

  // property
  Contact newContact = new Contact();

  // key
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text("Send json"),
      ),
      body: Form(
        key: _formKey,
        autovalidate: true,
        child: ListView(
          children: <Widget>[

            Text("Name: "),

            ListTile(
              title: TextFormField(
                decoration: InputDecoration(
                    hintText: "Name"
                ),
                onSaved: (value) => newContact.name = value,
              ),
            ),

            Text("Email: "),

            ListTile(
              title: TextFormField(
                decoration: InputDecoration(
                    hintText: "Email"
                ),
                onSaved: (value) => newContact.email = value,
              ),
            ),

            ListTile(
              title: RaisedButton(
                onPressed: () {
                  debugPrint("ON PRESSED");
                  _submitForm();
                },
                child: Text("Submit"),
              ),
            ),

          ],
        ),
      ),
    );
  }

  void showMessage(String message, [MaterialColor color = Colors.red]) {
    _scaffoldKey.currentState.showSnackBar(new SnackBar(backgroundColor: color, content: Text(message),));
  }

  void _submitForm() {
    final FormState form = _formKey.currentState;

    form.save(); // this invokes each onSaved event

    print("Form save..");
    print("Name: ${newContact.name}");
    print("Email: ${newContact.email}");
    print("Submitting to back end..");

    var contactService = new ContactService();
    contactService.createContact(newContact).then((value)=>showMessage("New contact created"));
  }

}
