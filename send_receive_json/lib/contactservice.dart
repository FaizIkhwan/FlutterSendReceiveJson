import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'contact.dart';

class ContactService {
  static const _serviceUrl = 'http://mockbin.org/echo';
  static final _headers = {'Content-Type' : 'application/json'};

  Future<Contact> createContact(Contact contact) async {
    try{
      String json = _toJson(contact);
      final response = await http.post(_serviceUrl, headers: _headers, body: json);
      var c = _fromJson(response.body);
      return c;
    }catch(e) {
      print("Server exception");
      print(e);
      return null;
    }
  }

  Contact _fromJson(String jsonContact) {
    Map<String, dynamic> map = json.decode(jsonContact);
    var contact = new Contact();
    contact.name = map["name"];
    contact.email = map["email"];

    return contact;
  }

  String _toJson(Contact contact) {
    var mapData = new Map();
    mapData["name"] = contact.name;
    mapData["email"] = contact.email;
    String jsonContact = json.encode(mapData);
    return jsonContact;
  }



}