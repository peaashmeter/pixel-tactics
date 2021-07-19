import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
//import 'package:ptapp/heroes.dart' as heroes;
import 'package:ptapp/menu.dart' as menu;
import 'json_handler.dart' as jsonHandler;

var query = ValueNotifier('');

void main() {
  runApp(new MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: new Text('База данных Pixel Tactics'),
          ),
          body: menu.MenuPage())));

  jsonHandler.loadJsonData();
}
