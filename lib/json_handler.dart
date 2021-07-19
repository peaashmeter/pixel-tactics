import 'dart:convert';
import 'dart:async';
import 'package:flutter/services.dart';
import 'package:ptapp/search_page.dart';

import 'heroes.dart';
import 'leaders.dart';

const String path = 'assets/data/data.json';
List<TabItem> heroesList = [];
List<TabItem> leadersList = [];
Map<String, dynamic> fromJson = {};

Future<String> loadJsonData() async {
  var jsonString = await rootBundle.loadString(path);
  fromJson = jsonDecode(jsonString);

  for (var i = 0; i < fromJson['heroes'].length; i++) {
    var _h = fromJson['heroes'][i];
    heroesList.add(TabItem(
        name: _h['name'],
        picture: _h['picture'],
        set: _h['set'],
        details: HeroDetailsScreen(
          name: _h['name'],
          picture: _h['picture'],
          atk: _h['details']['atk'],
          def: _h['details']['def'],
          vanguard: _h['details']['vanguard'],
          flank: _h['details']['flank'],
          rear: _h['details']['rear'],
          order: _h['details']['order'],
        )));
  }
  for (var i = 0; i < fromJson['leaders'].lenght; i++) {
    var _l = fromJson['leaders'][i];
    leadersList.add(TabItem(
        name: _l['name'],
        picture: _l['picture'],
        set: _l['set'],
        details: LeaderDetailsScreen(
            name: _l['name'],
            picture: _l['picture'],
            hero: _l['details']['hero'],
            atk: _l['details']['atk'],
            def: _l['details']['def'],
            ability: _l['details']['ability'],
            title: _l['details']['title'])));
  }

  return jsonString;
}
